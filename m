From: "SISINT BA" <INFO@SISINT.COM.AR>
Subject: Re: Denial-of-Service attack on UDP-port 5060 (SIP/VoIP)
Date: Mon, 29 Nov 2010 10:12:26 -0300
Message-ID: <001701cb8fc7$11ea6930$3202a8c0@p4w2000>
References: <C426DC428D95484BB7DF53F6DA1B34DB@gericomfx5600> <4CF2A686.4000309@plouf.fr.eu.org> <72283C9ECA07450499E7F3DDA655791F@gericomfx5600> <20101129025048.GQ23013@cardinal>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org


I think that  any undesired packets  must be  DROPPED  and not REJECTED
becasue in some way  REJECT  is  REPLY  WITH ..... and  DROP  is  just
UNREPLIED . less effort for FW , don't consume bandwith  and more important
don't give any reponse to source ip!!.

I read the post that you have mention  iptables Log , and  the info that you
got ON CLI  CONSOLE is the same  put on the log file for  asterisk too , so
both action must be taken , all that you need on FW and  all that you can on
Logfiles ,

I  agree , with you about bot attacks  and resources stolen o server /hosts
hacked,
 I have had    300 , or even more,  ip address blocked on my list at the
same time , because of them .  But like i said , if you block them after a
few packets , the attacks changes the ip source  to anotherone , keep trying
but  after  enough tries they left you to search onother server  more easy
to attack.  and believeme!!! , there are on the network server more
insecure that ours own , so more easy to be under attack .Except that the
attacks  wants to blcok your server by another reason ,,,, ie beacuse very
angry with you :-)...

  on the opposite way , when an attack were not blocked quickly,  the robot
can keep yours tries for days and beyond that you block them  and  can't
reach the VoIP service  because is being blocked ,  in this situation you
can't  avoid that the UDP voip registers packets arrives  to your  network
because don't  require any connection,  because of  UDP nature on itself ,
and i promess that thay will be " hugh bunch"  Flooding  your connection if
dont stop quickly.  In eralier times i had robots keep trying to steal over
one week at rates 2 MBits, obviusly blocked can't stole. limit can't stop
the server  Voip.... but injury me borrowing  bandwith that i need for mi
clients. :-(
 coming from CHINA, Korea, URSS, Brazil, USA, Detuchalnd,Australia  .. an
some others USA included)

So we  could  think in restrict the access to a cloud of IP well konwn ,
from where we expect  user will be conected. it's so helpfull too. in our
FW, drop any unkown, accept known and  jump  to onother Chain  any packets
on doubt , there we can log, mark, limit, and so forth  and at last, if this
progress an reach our server and  these tries   fails to register  then will
be blocked  trough our log analisis script ( in my case fail2ban)

Another help that fal2ban provides is that the info for abuse compliant are
mailed to we ( info are taken from ARIN,APNIC.... as correpond to ip soruce
that attacks ) this may be helpfull with some cases . to make the complaint
, may work with some ISP, but is solwwwwww and lonnnng way  below  i put
copy from mail sent by failt2ban when block an ip

Beyond all these .. NEVER nothig that we are doing will be  enough about
take care about security.
all that we can , must be made  to assure our server , any combination of
rules, services, configurations,  Yeap! it's a very hard work!!!

On other  thread  i have comment about a simple try to allow access based on
iptbales + ip sorce  identified by DDNS domain , i mean

the user that  need to access to your  server must be identified trough
source ip , ( ideal for fixed ip but not everyone has one ) , over dymamics
ip,   the user needs to run a ddns client   keeping  user  source domain
updated, ie over DYNDNS.

  client.domain.dyndns.org  and your connection to internet trough
input-eth-dev


iptables -I INPUT  -i input-eth-dev  -s  client.domain.dyndns.org  -j ACCEPT
iptables -I INPUT  -i input-eth-dev  -p udp  --dport 5060 -j DROP

this has some trouble with DNS caches refresehing when the client  ip
changes very often on  many cases where the ISP force disconects changing ip
on the users may be so hard and don't be usefull , like on some ADSL
providers ,  becasue any source change will require that your iptables
modules must be reloaded  at least so often like  you re-register  your
Voip sucscription on asterisk  (  beacause in FW rules based on domains will
be resolved to  the real ip that had at those moment (or that were cached
too)  when  the rule was loaded , here big trouble ) . it's a trouble  may
be handled with cron , but  it's a trouble in any way.


I hope that can help anynone
Thank you all .


like said  before here is the Copy of mail from  fal2ban notifyingme about
ip that was blcked

VERY IMPORTANT

PLEASE NOTE THAT HE INFO IS ABOUT THE  ISP PROVIDER THAT  HAVE THE  SOURCE
IP  UNDER YOUR ADMINSITRATION  , NOT THE IDENTITY OF  PEOPLE THAT MADE THE
ATTACK
BUT HAS THE  MAIL ADDRESS WHERE SEND THE DISCLAIM/COMPLAINT FOR ABUSE


###############################################################

Hi,

The IP 60.171.75.147 has just been banned by Fail2Ban after
237 attempts against ASTERISK-METRO1.


Here are more information about 60.171.75.147:

[Preguntando whois.apnic.net]
[whois.apnic.net]
% [whois.apnic.net node-2]
% Whois data copyright terms    http://www.apnic.net/db/dbcopyright.html

inetnum:      60.166.0.0 - 60.175.255.255
netname:      CHINANET-AH
descr:        CHINANET anhui province network
descr:        China Telecom
descr:        A12,Xin-Jie-Kou-Wai Street
descr:        Beijing 100088
country:      CN
admin-c:      CH93-AP
tech-c:       JW89-AP
mnt-by:       APNIC-HM
mnt-routes:   MAINT-CHINANET-AH
mnt-lower:    MAINT-CHINANET-AH
status:       ALLOCATED PORTABLE
changed:      hm-changed@apnic.net 20040721
source:       APNIC

person:       Chinanet Hostmaster
nic-hdl:      CH93-AP
e-mail:       anti-spam@ns.chinanet.cn.net
address:      No.31 ,jingrong street,beijing
address:      100032
phone:        +86-10-58501724
fax-no:       +86-10-58501724
country:      CN
changed:      dingsy@cndata.com 20070416
mnt-by:       MAINT-CHINANET
source:       APNIC

person:       Jinneng Wang
address:      17/F, Postal Building No.120 Changjiang
address:      Middle Road, Hefei, Anhui, China
country:      CN
phone:        +86-551-2659073
fax-no:       +86-551-2659287
e-mail:       wang@mail.hf.ah.cninfo.net
nic-hdl:      JW89-AP
mnt-by:       MAINT-NEW
changed:      wang@mail.hf.ah.cninfo.net 19990818
source:       APNIC

Regards,

Fail2Ban


----- Original Message -----
From: "/dev/rob0" <rob0@gmx.co.uk>
To: <netfilter@vger.kernel.org>
Sent: Sunday, November 28, 2010 11:50 PM
Subject: Re: Denial-of-Service attack on UDP-port 5060 (SIP/VoIP)


> On Sun, Nov 28, 2010 at 10:31:24PM +0100, Secure-SIP-Server wrote:
> > @ Pascal Hambourg
> >
> >> > I'm suffering on a Denial-of-Service attack on my SIP(VoIP) UDP
> >> > port 5060, getting more then 70 REGISTER requests per second
> >> > since yesterday. All comming from the Japanese IP
> >> > 59.146.75.111:5088.
> >> [...]
> >> > How can this requests (UDP) be from a ESTABLISHED connection???
> >> > They passed the firewall in the first two examples and therefore
> >> > they must be ESTABLISHED!?!
> >>
> >> UDP being connectionless by nature, the notion of "UDP connection"
> >> is rather loose. Therefore a continuous flow of packets with the
> >> same ports and addresses can be considered as one sigle connection
> >> even if they are actually unrelated requests.
>
> This is the problem I too am having in trying to block SIP attacks,
> which I posted about ever so long ago, back in 2010 November:
>
> http://www.spinics.net/lists/netfilter/msg49598.html
>
> The brute forcing generally seems to come with the same --sport, and
> since my Asterisk had replied with SIP rejections to the first few,
> it's ESTABLISHED.
>
> Since that post, however, I have seen a few of these being detected
> and blocked, which makes me think there might be multiple attack bots
> (different code and owners) in the wild.
>
> I think that the -m recent approach is not enough. We might also need
> something with -m limit. At this point I don't know enough about SIP
> and how it works, but I'm guessing that the SIP dialogue for a
> successful call is relatively short, so a --limit of 20 packets or so
> might help, preceding any --ctstate ESTABLISHED,RELATED -j ACCEPT
> rule, of course.
>
> The bulk of a SIP call would be the RTP, which would be on ports
> other than 5060, in --ctstate RELATED (courtesy of the
> nf_conntrack_sip module.)
>
> > Yes, looks like. I discovered that this only happens if I add the
> > FW-rule later then the first connection of the attacker to my
> > SIP-server happened. When I install the rule to DROP this requests
> > behind
> > iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> > I must reboot the server before it works. If I don't want to reboot
> > I must put the DROP rule before this rule.
>
> Reboot is never necessary for this, unless you did something foolish
> with your kernel (built-in rather than modules?) See conntrack(8),
> and even without conntrack you can simply flush your rules, set all
> policies to ACCEPT, and remove the modules.
>
> >> > Is there a way to tell iptables to lock only a specific IP:PORT
> >> > for a while if this IP transmits more then 50 requests per
> >> > second? If so, how?
> >>
> >> Check the "recent" match. Be sure you read carefully the man page
> >> about its default limits.
> >
> > Thanks for this!!! But ...
> > The author of "recent" writes:
> > "If the '--update' rule is before this check for ! NEW,INVALID
> > packets then ESTABLISHED connection or those in the process of
> > becoming ESTABLISHED could be disrupted by a malicious person who
> > can modify his/her source address."
> > So in his opinion my
> > iptables -A INPUT -p udp --dport 5060 -m recent --update --seconds
> > 1 --hitcount 20 -j DROP
> > must come behind
> > iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> > and this leads me to the problem from above. This ACCEPT rule lets
> > pass all packages, because the first 19 packets in the first second
> > are accepted and therefore the FW considers the continuous flow of
> > packets with the same port and address as a single connection - and
> > let them pass here.
> >
> > Is there a way to tell the FW that this continuous flow of packets
> > is not to be considered a ESTABLISHED connection?
>
> We precede the ESTABLISHED --> ACCEPT rule with something to handle
> SIP specially. Ugly, but probably the only choice.
>
> > ----------
> > @marcos
> >
> >> i had the same trouble in the past , and beyond the rules for your
> >> FW on itself there is " other consideration" to get on mind , all
> >> people that are trying to steal Voip deploy you "brute force
> >> attack" first trying with few packets, then if they were not
> >> blocked , the real attacks begins later .  because don't have any
> >> sense keep attack to a blocked server, thay are bad no dummies .
>
> This fits with my experience as well, but don't count on it always
> being like this. Remember, the vast majority of these attack bots are
> operating from stolen resources (compromised systems.) It doesn't
> matter to them if they waste those resources, because the bots are
> out there continually working to steal more.
>
> That's why abuse reports might still be worth the trouble. If the
> REAL owners of the attacking machines are alerted to the problem,
> they might take action to fix it. At least in a small portion of
> cases, don't get your hopes up.
>
> >> so the speed with you blocks these tries are so critical and will
> >> defines to your intruder how effective is the defense that you
> >> have.
> >>
> >> So will be so helpfull install some script that inspect your logs
> >> to detect the intrusion attack , i have very well result with
> >> FAIL2BABN, [...]
> >
> > Thank you for this idea and your other considerations!!!
>
> I have complaints with fail2ban. Yes, I know it works, and it's
> simple, but it doesn't feel like the right approach to me. Why do we
> need another daemon running to scan log files? Logs are for humans.
> I'd like to see network services with the ability to trigger external
> events when they're under attack.
>
> Failing that, -m recent is pretty effective, but in the case of SIP,
> apparently not quite enough. (It works very well for SSH.)
> --
>     Offlist mail to this address is discarded unless
>     "/dev/rob0" or "not-spam" is in Subject: header
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

