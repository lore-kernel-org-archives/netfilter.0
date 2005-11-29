From: =?ISO-8859-2?Q?=A3ukasz_Hejnak?= <grupy@szift.org>
Subject: Re: Is using a blacklist in iptables a good strategy?
Date: Tue, 29 Nov 2005 09:44:25 +0100
Message-ID: <438C14E9.5010309@szift.org>
References: <1133252475.20357.5.camel@sonoda.bioscene.co.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1133252475.20357.5.camel@sonoda.bioscene.co.jp>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: NetFilter <netfilter@lists.netfilter.org>

David Leangen napisa=B3(a):
> Hello,
Hi :]
> I don't know why, but I'm getting a little fed up with break-in attempts
> happening every single day.
don't we all?
> Do I just have to accept this as a fact of life?
sadly yes.
but there are better and worse ways of preventing them..
> I started keeping a list of IP addresses that I'm just going to
> blacklist, but this does not seem like a maintainable solution. For now,
well I think this is a bad way of doing this, I had such a blacklist=20
once.. now for _some_ IP's I've got it also, but I decided to only block=20
the IPs that I can see in my logs really often, that's more than 2,3=20
days in a row
The thing is: ip spoofing, redirecting, zombie machines etc
So by blocking a single IP or an IP range You can just by accident block=20
off someone that really would use Your server..

My current way of doing this is using the ipt_recent
so now I only block the 'strage connections' for some time,
the less common get blocked for 4 minutes, the more common (port 22 for=20
example) are blocked for an hour..
Apart from blocking I also tarpit them, so I guess this is anoying to=20
try to scan my host, even though it of course is possible,
it takes a long time ;]

here's some copy/paste from my current ipt rule set
the ssh port used in the below config is 42156
it's good to have a high port ssh, as then most of the default scans for=20
22 don't do anything, and so do brute force attacks have a problem to=20
what port to try, apart from that, brute force attacks are handled here=20
in a more specific way

# First a 'BigTime' chain, for those that there's no hope for ;]
$ipt -N bigtime
$ipt -A bigtime -p tcp -j TARPIT
$ipt -A bigtime -j DROP

# second a 'byebye' chain for those that are supposed to get logged once
$ipt -N byebye
# log the source ip of the packet, as well as compare it's fingerprint
# to a set of fingerprints for different OS's, so often I know
# not only the IP, but also the more or less accurate OS version
$ipt -A byebye -p tcp -m osf --log 1 --smart
$ipt -A byebye -j LOG --log-level debug --log-prefix "Bugger byebye: "
$ipt -A byebye -p tcp -j TARPIT
$ipt -A byebye -j DROP

# now here's a chain for the SSH_Brute_Foce check
# notice below, as everything that enters this chain is
# tagged with 'SSH' name
$ipt -N SSH_Brute_Force
# let me from my home pc in
$ipt -A SSH_Brute_Force -s $MyIP -j ACCEPT
# if less than three times the packet got here (3 login try's)
# let him trough
$ipt -A SSH_Brute_Force -m recent ! --rcheck --name SSH --seconds 60=20
--hitcount 3 -j ACCEPT
# if this is the fourth attempt within the last 60s then go to byebye,
# where it is logged
$ipt -A SSH_Brute_Force -m recent ! --rcheck --name SSH --seconds 60=20
--hitcount 4 -j byebye
$ipt -A SSH_Brute_Force -m recent --name SSH --update
# each next attempt will be tarpited/droped
$ipt -A SSH_Brute_Force -p tcp -j TARPIT
$ipt -A SSH_Brute_Force -j DROP

# and last but not least, a rule for everything else that hits
# the firewall and should not (not existing services)
# the list of interesting porst here (I don't service those outside,
# and nobody should hit them)
porty=3D"20 21 22 23 42 53 137 138 139 143 412 1026 1027 1028 1029 1030=20
1080 1433 4899 8080 10000 15118"
# notice below, as everything that enters this chain is
# tagged with 'abuggeri' name
$ipt -N buggerin
# my IP goes trough :]
$ipt -A buggerin -i eth0 -s $MyIP -j ACCEPT
# now all of those bad PORTs are re-tagged with the name 'abuggerti'
for port in $porty; do
     $ipt -A buggerin -p tcp --dport $port -m recent --set --name abuggerti
     $ipt -A buggerin -p udp --dport $port -m recent --set --name abuggerti
done
# if the abuggerti appear any more than one in a hour,
# they go directly to the BigTime chain
$ipt -A buggerin -m recent --rcheck --name abuggerti --seconds 3600=20
--hitcount 2 -j bigtime
# else they're logged
$ipt -A buggerin -m recent --rcheck --name abuggerti -p tcp -m osf --log=20
1 --smart
$ipt -A buggerin -m recent --rcheck --name abuggerti -j LOG --log-level=20
debug --log-prefix "BigtimeI: "
$ipt -A buggerin -m recent --name abuggerti --update
# and then they go to BigTime
$ipt -A buggerin -m recent --rcheck --name abuggerti -j bigtime
# as for other ports, they are logged and blocked for 4 minutes
$ipt -A buggerin -m recent ! --rcheck --name abuggeri --seconds 240=20
--hitcount 2 -j byebye
$ipt -A buggerin -m recent --name abuggeri --update
$ipt -A buggerin -p tcp -j TARPIT
$ipt -A buggerin -j DROP


# now as for the NEW SSH packets, let's tag it with 'SSH'
$ipt -A INPUT -p tcp --dport 42156 -m state --state NEW -m recent --set=20
--name SSH
# and send all of those 'SSH' to SSH_Brute_Force
$ipt -A INPUT -m recent --rcheck --name SSH -j SSH_Brute_Force

# these two are on the end of the firewall, they redirect anything
# that was not let trough (tag it with 'abuggeri') to the buggerin chain
$ipt -A INPUT -m recent --set --name abuggeri
$ipt -A INPUT -m recent --rcheck --name abuggeri -j buggerin


hope this helps :]

All of this was inspired by the 'SSH Brute Force discussion' at netfiler
the main branch of this thread is started here
(It was in May afterall.. ahh.. time flys..)
https://lists.netfilter.org/pipermail/netfilter/2005-May/060299.html
and another one here:
https://lists.netfilter.org/pipermail/netfilter/2005-May/060578.html

and there are some more in June and July

--
Best wishes
=A3ukasz Hejnak

