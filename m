From: "Matt Hellman" <mhellman@taxandfinance.com>
Subject: RE: possibly annoing ...
Date: Thu, 27 Feb 2003 22:18:39 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000101c2dee0$78f1fa80$fd0aa8c0@winxp>
References: <001301c2de8c$263cc620$c80da8c0@service.agress.ro>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001301c2de8c$263cc620$c80da8c0@service.agress.ro>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: "'PiSiC...'" <pisic@service.agress.ro>
Cc: netfilter@lists.netfilter.org

I'll give you an example. It assumes a default drop policy. Also, INTIF =
=3D
internal interface, HTTP1 =3D external ip address clients will connect =
to
(www.mydomain.com resolves to this address), and HTTPDMZ1 =3D internal =
web
server.

##### Setup prerouting rules to route Internet traffic internally
## Change the destination of external $HTTP requests to the DMZ HTTP =
server
$ipt -t nat -A PREROUTING -i $EXTIF -p tcp -d $HTTP1 --dport 33333 -j =
DNAT
--to $HTTPDMZ1:80

## Allow established,related forward traffic
$ipt -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

## Allow new http forward traffic from Internet to servers in the DMZ
$ipt -A FORWARD -m state --state NEW -i $EXTIF -p tcp -d $HTTPDMZ1 =
--dport
80 -j ACCEPT
$ipt -A FORWARD -m state --state NEW -i $EXTIF -p tcp -d $SMTPDMZ =
--dport 25
-j ACCEPT

>>-----Original Message-----
>>From: netfilter-admin@lists.netfilter.org=20
>>[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of PiSiC...
>>Sent: Thursday, February 27, 2003 12:15 PM
>>To: richardo@start-global.com
>>Cc: netfilter@lists.netfilter.org
>>Subject: Re: possibly annoing ...
>>
>>
>> First of all thanks for help ...
>> but i'm kinda new with iptables and i want to show you the=20
>>big picture :
>>
>> - i heard something about static NAT and dynamic NAT (not source or
>>destination NAT) and i'm not sure i fully understand what is the
>>aplicability on my situation.
>>
>>the situation is this :
>>
>> i have a radio link with only one staticaly allocated  IP=20
>>(aaa.bbb.ccc.ddd)
>>which is connected on my linux machine on eth1
>>eth0 on the same machine is connected on LAN.
>>I have up and running Webserver,SMTP,FTP and POP3.
>>I want to run now 2 webservers one on external and one on=20
>>internal(that is
>>easy with binding on their interfaces).
>>But i want also to allow access from the world to a third=20
>>webserver which
>>runs on 192.168.13.199:80 which will be accesibile on port 33333 on my
>>external ip.
>>
>>... my machine runs Slackware 8.0 with kernel 2.4.5. and i=20
>>have compiled the
>>kernel with all the features included(i don't need modprobe).
>>
>>
>>I wonder if you can give me an rc.firewall for this situation=20
>>or at least
>>the tricky part(webserver on 192.168.13.199) with all their=20
>>related stuff.
>>
>>       Thank you very much in advance.
>>
>>                                                      Danila Octavian
>>
>>
>>
>>


