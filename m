From: Zen Kato <zenkato@pis.bekkoame.ne.jp>
Subject: Re: iptables SNAT and sip "REGISTER"
Date: Tue, 09 Sep 2003 08:21:06 +0900
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030909082106I.zenkato@pis.bekkoame.ne.jp>
References: <20030901082901R.zenkato@pis.bekkoame.ne.jp>
	<20030903194627.25529b33.arnt@c2i.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030903194627.25529b33.arnt@c2i.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: Text/Plain; charset="us-ascii"
To: arnt@c2i.net
Cc: netfilter@lists.netfilter.org

Hi Arnt,

Thank you for your comment.
I upgraded to RHL-7.3 linux-2.4.20-20.7 and iptables-1.2.8-8.72.3.

SIP UAs could send and receive "REGISTER", "INVITE", "200 OK", 
"ACK" and udp media packets via .100.30. So, DNAT/SNAT of iptales-
1.2.8 works fine, but both sip phones can not have "audio"?!

Both sip phones worked fine when I tested using non-NAT with a local
sip proxy. I don't know why this case does not work.


------------- iptables DNAT/SNAT -------------
$IPTABLES -t nat -A PREROUTING -d tel.no-ip.com -p udp --dport 5064 -j DNAT --to 192.168.100.26
$IPTABLES -t nat -A PREROUTING -d tel.no-ip.com -p udp --dport 5070 -j DNAT --to 192.168.100.6
$IPTABLES -t nat -A PREROUTING -d tel.no-ip.com -p udp --dport 5071 -j DNAT --to 192.168.100.7
$IPTABLES -t nat -A PREROUTING -d tel.no-ip.com -p udp --dport 20000:20003 -j DNAT --to 192.168.100.6
$IPTABLES -t nat -A PREROUTING -d tel.no-ip.com -p udp --dport 20004:20007 -j DNAT --to 192.168.100.7

$IPTABLES -t nat -A POSTROUTING -d 192.168.100.26 -s 192.168.100.0/24 -p udp --dport 5064 -j SNAT --to 192.168.100.30
$IPTABLES -t nat -A POSTROUTING -d 192.168.100.6 -s 192.168.100.0/24 -p udp --dport 5070 -j SNAT --to 192.168.100.30
$IPTABLES -t nat -A POSTROUTING -d 192.168.100.7 -s 192.168.100.0/24 -p udp --dport 5071 -j SNAT --to 192.168.100.30
$IPTABLES -t nat -A POSTROUTING -d 192.168.100.6 -s 192.168.100.0/24 -p udp --dport 20000:20003 -j SNAT --to 192.168.100.30
$IPTABLES -t nat -A POSTROUTING -d 192.168.100.7 -s 192.168.100.0/24 -p udp --dport 20004:20007 -j SNAT --to 192.168.100.30

-------- ethereal summary .100.7 to .100.6 --------
    No. Time        Source                Destination           Protocol Info
      1 0.000000    192.168.100.7         218.230.63.163        SIP/SDP  Request: INVITE sip:1011@tel.no-ip.com:5064, with session description
      2 0.000980    192.168.100.30        192.168.100.26        SIP/SDP  Request: INVITE sip:1011@tel.no-ip.com:5064, with session description
      3 0.084179    192.168.100.26        192.168.100.30        SIP      Status: 100 trying -- your call is important to us
      4 0.085040    218.230.63.163        192.168.100.7         SIP      Status: 100 trying -- your call is important to us
      5 0.090641    192.168.100.26        218.230.63.163        SIP/SDP  Request: INVITE sip:1011@218.230.63.163:5070, with session description
      6 0.091568    192.168.100.30        192.168.100.6         SIP/SDP  Request: INVITE sip:1011@218.230.63.163:5070, with session description
      7 0.095537    192.168.100.6         192.168.100.30        SIP      Status: 100 trying
      8 0.096102    218.230.63.163        192.168.100.26        SIP      Status: 100 trying
      9 0.096916    192.168.100.6         192.168.100.30        SIP      Status: 180 ringing
     10 0.097352    218.230.63.163        192.168.100.26        SIP      Status: 180 ringing
     11 0.102475    192.168.100.26        192.168.100.30        SIP      Status: 180 ringing
     12 0.102902    218.230.63.163        192.168.100.7         SIP      Status: 180 ringing
     13 0.678665    192.168.100.6         66.7.238.210          UDP      Source port: 20000  Destination port: 3478
     14 0.823669    66.7.238.210          192.168.100.6         UDP      Source port: 3478  Destination port: 20000
     15 2.183102    192.168.100.6         192.168.100.30        SIP/SDP  Status: 200 OK, with session description
     16 2.184215    218.230.63.163        192.168.100.26        SIP/SDP  Status: 200 OK, with session description
     17 2.189126    192.168.100.26        192.168.100.30        SIP/SDP  Status: 200 OK, with session description
     18 2.189904    218.230.63.163        192.168.100.7         SIP/SDP  Status: 200 OK, with session description
     19 2.208574    192.168.100.7         218.230.63.163        SIP      Request: ACK sip:1011@218.230.63.163:5070
     20 2.209506    192.168.100.30        192.168.100.6         SIP      Request: ACK sip:1011@218.230.63.163:5070
     21 2.212399    192.168.100.7         218.230.63.163        UDP      Source port: 20004  Destination port: 20000
     22 2.212905    192.168.100.30        192.168.100.6         UDP      Source port: 20004  Destination port: 20000
     23 2.228696    192.168.100.6         218.230.63.163        UDP      Source port: 20000  Destination port: 20004
     24 2.229186    192.168.100.30        192.168.100.7         UDP      Source port: 20000  Destination port: 20004
...............(snip)....................
     25 5.320208    192.168.100.6         218.230.63.163        SIP      Request: BYE sip:1021@218.230.63.163:5071
     26 5.321063    192.168.100.30        192.168.100.7         SIP      Request: BYE sip:1021@218.230.63.163:5071
     27 5.324401    192.168.100.7         192.168.100.30        SIP      Status: 200 OK
     28 5.324909    218.230.63.163        192.168.100.6         SIP      Status: 200 OK
-------------- end ---------------

Regards,

Zen

From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: iptables SNAT and sip "REGISTER"
Date: Wed, 3 Sep 2003 19:46:27 +0200

> On Mon, 01 Sep 2003 08:29:01 +0900, 
> Zen Kato <zenkato@pis.bekkoame.ne.jp> wrote in message 
> <20030901082901R.zenkato@pis.bekkoame.ne.jp>:
> 
> >            |.1           192.168.0.0/24
> >       --------------------------------
> >                    |.30(eth1,eth1:0 tel.no-ip.com)
> >               -------------------
> >               | RHL7.3          |
> 
> ..ok.
> 
> >               | Linux-2.4.18-3  |
> >               | iptables V1.2.5 |
> 
> ..no way!  Go check http://rhn.redhat.com/errata/rh73-errata.html
> and fix your RH box, if it _ever_ sees Internet or vice versa.
> 
> >               -------------------
> 
> 
> -- 
> ..med vennlig hilsen = with Kind Regards from Arnt... ;-)
> ...with a number of polar bear hunters in his ancestry...
>   Scenarios always come in sets of three: 
>   best case, worst case, and just in case.
> 
> 
> 


