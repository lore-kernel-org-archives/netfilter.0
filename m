From: Rahul Jadhav <rahul@iatp.org>
Subject: Re: new tcp connections, without SYN
Date: Thu, 10 Apr 2003 12:53:07 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E95AF83.5050508@iatp.org>
References: <7497DCA1C240C042B28F6657ADFD8E09268777@i2km11-ukbr.domain1.systemhost.net> <1049964481.790.4.camel@elendil.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Cedric Blancher <blancher@cartel-securite.fr>
Cc: netfilter@lists.netfilter.org

I have been following your messages for a  while now and I tried the '!=20
--syn' and '--state NEW, RELATED' rule without much success. I am trying=20
to completely block the nmap -P0 and -PS probes.
Now I know I might need to recompile iptables with tcp-nopickup patch.=20
Can you please elaborate more on what it does.
And, also someone please write back rules to block port scans (do I HAVE=20
to block ICMP completely for that?).

Rahul

Cedric Blancher wrote:

>Le mer 09/04/2003 =E0 18:04, dhiraj.2.bhuyan@bt.com a =E9crit :
> =20
>
>>I tried sending an "ACK" packet from behind my Netfilter firewall to a
>>machine on the public side that actually doesn't exist.
>>A look in the /proc/net/ip_conntrack tells me that Netfilter tracked this
>>connection as "ESTABLISHED" but "UNREPLIED". So Netfilter does infact all=
ow
>>starting a TCP connection with an ACK packet.
>>   =20
>>
>
>Yes it does, unless you apply tcp-nopickup patch that enforces NEW and
>RELATED TCP packets must be SYN ones, flaging others as INVALID.
>
>This behaviour allows one to handle connections for which firewall have
>not seen SYN packet, such as asymetrical routing, failover, reboot and
>stuff.
>
> =20
>
--=20
         __  __     __   __=09
        /_/ /_ \  _/ /  /  \	Institute for Agriculture
       __  __/ / \  _/ / / /	and Trade Policy
      / / /   /  / /  / __/	2105 First Ave S
     / / / / /  / /_ / /	Minneapolis MN 55404
     \/  \__/   \__/ \/		http://www.iatp.org

       I N F O R M A T I O N   T E C H N O L O G Y

The best things in life are done by people with nowhere to turn.
                                -The Blind Assassin (Margaret Atwood)




