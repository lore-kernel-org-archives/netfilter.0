From: Mike Hendrie <mike@hendrienet.com>
Subject: Re: Proxy Filter iptable Settings
Date: Thu, 28 Apr 2011 16:43:01 -0500
Message-ID: <BANLkTikM3czG=D7yq3UHhQdt-pUcjpbKSA@mail.gmail.com>
References: <BANLkTin=W-MWbPfrpqnmWDCMq9fGp5CvwQ@mail.gmail.com>
	<1303885014.18916.10.camel@andybev-desktop>
	<BANLkTikUnSoefT3Xy=O+43zWGEw3tgb7wQ@mail.gmail.com>
	<4DB80945.8040304@atc.tcs.com>
	<BANLkTiky5xV9yhr-1nq7cLOSmV1nGt=cKg@mail.gmail.com>
	<4DB817A5.3020604@atc.tcs.com>
	<BANLkTi=y37mzCOenHg8EbR_u9PpoTVceGA@mail.gmail.com>
	<4DB90AE6.9070909@atc.tcs.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4DB90AE6.9070909@atc.tcs.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Vigneswaran R <vignesh@atc.tcs.com>
Cc: netfilter@vger.kernel.org

All users can get to Google and do searches just fine. I am having
funny issues with the a couple of application.

I do not understand why I am having the below issues. Could this be
because of the iptables?


- The internal server, 172.20.0.13, hosting the web site does not
allow LAN clients to resolve the actual public DNS URL.
	It resolves to the correct public IP address, but it cannot find the
URL through the firewall. However, I can find the website fine from my
home computer.
	The LAN clients are able to use the LAN IP to see the website.

ERROR
The requested URL could not be retrieved
The following error was encountered while trying to retrieve the URL:
http://www.twinlakes.k12.wi.us/
Connection to 216.56.4.133 failed.
The system returned: (110) Connection timed out


- There is FileMaker application that uses ports 5000 - 5005 to
connect to an external server that cannot find the external server.
??StatefulNAT translation.??
- There is a yearbook website that uploads photos to an external
server that does not allow the upload via the webpage. However, I can
upload the photos if I install the application local to the
workstation, the vendor had a local installation of the photo upload
available.


Infrastructure Information:

Server: Ubuntu 10.10
Proxy: squid
Gateway: All workstations are using this as the gateway
=46ilter content: squidGuard


iptable command used: iptables -t nat -A PREROUTING -i eth1 -p tcp
--dport 80 -j REDIRECT --to-port 8080
iptables -L: (listed at the end)
=46irewall: ufw status enabled with the following ports opened....
UFW:
Status: active

To                         Action      From
--                         ------      ----
22                         ALLOW       Anywhere
80                         ALLOW       Anywhere
443                        ALLOW       Anywhere
8080                       ALLOW       Anywhere
5900                       ALLOW       Anywhere
5001                       ALLOW       Anywhere
8530                       ALLOW       Anywhere
3389                       ALLOW       Anywhere
21                         ALLOW       Anywhere
5151                       ALLOW       Anywhere
53                         ALLOW       Anywhere
25                         ALLOW       Anywhere
5000                       ALLOW       Anywhere
5002                       ALLOW       Anywhere
5003                       ALLOW       Anywhere
5004                       ALLOW       Anywhere
5005                       ALLOW       Anywhere


-----------------------------------------------------------------------=
-------
iptables -L
Chain INPUT (policy DROP)
target     prot opt source               destination
ufw-before-logging-input  all  --  anywhere             anywhere
ufw-before-input  all  --  anywhere             anywhere
ufw-after-input  all  --  anywhere             anywhere
ufw-after-logging-input  all  --  anywhere             anywhere
ufw-reject-input  all  --  anywhere             anywhere
ufw-track-input  all  --  anywhere             anywhere

Chain FORWARD (policy DROP)
target     prot opt source               destination
ufw-before-logging-forward  all  --  anywhere             anywhere
ufw-before-forward  all  --  anywhere             anywhere
ufw-after-forward  all  --  anywhere             anywhere
ufw-after-logging-forward  all  --  anywhere             anywhere
ufw-reject-forward  all  --  anywhere             anywhere

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination
ufw-before-logging-output  all  --  anywhere             anywhere
ufw-before-output  all  --  anywhere             anywhere
ufw-after-output  all  --  anywhere             anywhere
ufw-after-logging-output  all  --  anywhere             anywhere
ufw-reject-output  all  --  anywhere             anywhere
ufw-track-output  all  --  anywhere             anywhere

Chain ufw-after-forward (1 references)
target     prot opt source               destination

Chain ufw-after-input (1 references)
target     prot opt source               destination
ufw-skip-to-policy-input  udp  --  anywhere             anywhere
     udp                             dpt:netbios-ns
ufw-skip-to-policy-input  udp  --  anywhere             anywhere
     udp                             dpt:netbios-dgm
ufw-skip-to-policy-input  tcp  --  anywhere             anywhere
     tcp                             dpt:netbios-ssn
ufw-skip-to-policy-input  tcp  --  anywhere             anywhere
     tcp                             dpt:microsoft-ds
ufw-skip-to-policy-input  udp  --  anywhere             anywhere
     udp                             dpt:bootps
ufw-skip-to-policy-input  udp  --  anywhere             anywhere
     udp                             dpt:bootpc
ufw-skip-to-policy-input  all  --  anywhere             anywhere
     ADDR                            TYPE match dst-type BROADCAST

Chain ufw-after-logging-forward (1 references)
target     prot opt source               destination
LOG        all  --  anywhere             anywhere            limit:
avg 3/min bu                            rst 10 LOG level warning
prefix `[UFW BLOCK] '

Chain ufw-after-logging-input (1 references)
target     prot opt source               destination
LOG        all  --  anywhere             anywhere            limit:
avg 3/min bu                            rst 10 LOG level warning
prefix `[UFW BLOCK] '

Chain ufw-after-logging-output (1 references)
target     prot opt source               destination

Chain ufw-after-output (1 references)
target     prot opt source               destination

Chain ufw-before-forward (1 references)
target     prot opt source               destination
ufw-user-forward  all  --  anywhere             anywhere

Chain ufw-before-input (1 references)
target     prot opt source               destination
ACCEPT     all  --  anywhere             anywhere
ACCEPT     all  --  anywhere             anywhere            state
RELATED,ESTAB                            LISHED
ufw-logging-deny  all  --  anywhere             anywhere
state INVALI                            D
DROP       all  --  anywhere             anywhere            state INVA=
LID
ACCEPT     icmp --  anywhere             anywhere            icmp
destination-un                            reachable
ACCEPT     icmp --  anywhere             anywhere            icmp sourc=
e-quench
ACCEPT     icmp --  anywhere             anywhere            icmp time-=
exceeded
ACCEPT     icmp --  anywhere             anywhere            icmp
parameter-prob                            lem
ACCEPT     icmp --  anywhere             anywhere            icmp echo-=
request
ACCEPT     udp  --  anywhere             anywhere            udp
spt:bootps dpt:                            bootpc
ufw-not-local  all  --  anywhere             anywhere
ACCEPT     all  --  BASE-ADDRESS.MCAST.NET/4  anywhere
ACCEPT     all  --  anywhere             BASE-ADDRESS.MCAST.NET/4
ufw-user-input  all  --  anywhere             anywhere

Chain ufw-before-logging-forward (1 references)
target     prot opt source               destination

Chain ufw-before-logging-input (1 references)
target     prot opt source               destination

Chain ufw-before-logging-output (1 references)
target     prot opt source               destination

Chain ufw-before-output (1 references)
target     prot opt source               destination
ACCEPT     all  --  anywhere             anywhere
ACCEPT     all  --  anywhere             anywhere            state
RELATED,ESTAB                            LISHED
ufw-user-output  all  --  anywhere             anywhere

Chain ufw-logging-allow (0 references)
target     prot opt source               destination
LOG        all  --  anywhere             anywhere            limit:
avg 3/min bu                            rst 10 LOG level warning
prefix `[UFW ALLOW] '

Chain ufw-logging-deny (2 references)
target     prot opt source               destination
RETURN     all  --  anywhere             anywhere            state
INVALID limit                            : avg 3/min burst 10
LOG        all  --  anywhere             anywhere            limit:
avg 3/min bu                            rst 10 LOG level warning
prefix `[UFW BLOCK] '

Chain ufw-not-local (1 references)
target     prot opt source               destination
RETURN     all  --  anywhere             anywhere            ADDRTYPE
match dst-                            type LOCAL
RETURN     all  --  anywhere             anywhere            ADDRTYPE
match dst-                            type MULTICAST
RETURN     all  --  anywhere             anywhere            ADDRTYPE
match dst-                            type BROADCAST
ufw-logging-deny  all  --  anywhere             anywhere
limit: avg 3                            /min burst 10
DROP       all  --  anywhere             anywhere

Chain ufw-reject-forward (1 references)
target     prot opt source               destination

Chain ufw-reject-input (1 references)
target     prot opt source               destination

Chain ufw-reject-output (1 references)
target     prot opt source               destination

Chain ufw-skip-to-policy-forward (0 references)
target     prot opt source               destination
DROP       all  --  anywhere             anywhere

Chain ufw-skip-to-policy-input (7 references)
target     prot opt source               destination
DROP       all  --  anywhere             anywhere

Chain ufw-skip-to-policy-output (0 references)
target     prot opt source               destination
ACCEPT     all  --  anywhere             anywhere

Chain ufw-track-input (1 references)
target     prot opt source               destination

Chain ufw-track-output (1 references)
target     prot opt source               destination
ACCEPT     tcp  --  anywhere             anywhere            state NEW
ACCEPT     udp  --  anywhere             anywhere            state NEW

Chain ufw-user-forward (1 references)
target     prot opt source               destination

Chain ufw-user-input (1 references)
target     prot opt source               destination
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:ss=
h
ACCEPT     udp  --  anywhere             anywhere            udp dpt:ss=
h
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:ww=
w
ACCEPT     udp  --  anywhere             anywhere            udp dpt:ww=
w
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:ht=
tps
ACCEPT     udp  --  anywhere             anywhere            udp dpt:ht=
tps
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:ht=
tp-alt
ACCEPT     udp  --  anywhere             anywhere            udp dpt:ht=
tp-alt
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:59=
00
ACCEPT     udp  --  anywhere             anywhere            udp dpt:59=
00
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:50=
01
ACCEPT     udp  --  anywhere             anywhere            udp dpt:50=
01
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:85=
30
ACCEPT     udp  --  anywhere             anywhere            udp dpt:85=
30
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:33=
89
ACCEPT     udp  --  anywhere             anywhere            udp dpt:33=
89
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:ft=
p
ACCEPT     udp  --  anywhere             anywhere            udp dpt:fs=
p
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:pc=
rd
ACCEPT     udp  --  anywhere             anywhere            udp dpt:51=
51
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:do=
main
ACCEPT     udp  --  anywhere             anywhere            udp dpt:do=
main
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:sm=
tp
ACCEPT     udp  --  anywhere             anywhere            udp dpt:25
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:50=
00
ACCEPT     udp  --  anywhere             anywhere            udp dpt:50=
00
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:rf=
e
ACCEPT     udp  --  anywhere             anywhere            udp dpt:rf=
e
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:50=
03
ACCEPT     udp  --  anywhere             anywhere            udp dpt:50=
03
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:50=
04
ACCEPT     udp  --  anywhere             anywhere            udp dpt:50=
04
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:50=
05
ACCEPT     udp  --  anywhere             anywhere            udp dpt:50=
05

Chain ufw-user-limit (0 references)
target     prot opt source               destination
LOG        all  --  anywhere             anywhere            limit:
avg 3/min bu                            rst 5 LOG level warning prefix
`[UFW LIMIT BLOCK] '
REJECT     all  --  anywhere             anywhere
reject-with icmp-po                            rt-unreachable

Chain ufw-user-limit-accept (0 references)
target     prot opt source               destination
ACCEPT     all  --  anywhere             anywhere

Chain ufw-user-logging-forward (0 references)
target     prot opt source               destination

Chain ufw-user-logging-input (0 references)
target     prot opt source               destination

Chain ufw-user-logging-output (0 references)
target     prot opt source               destination

Chain ufw-user-output (1 references)
target     prot opt source               destination





On Thu, Apr 28, 2011 at 1:36 AM, Vigneswaran R <vignesh@atc.tcs.com> wr=
ote:
> On 04/27/2011 07:11 PM, Mike Hendrie wrote:
>>
>> Squid box 172.20.0.3
>> All workstations gateway are 172.20.0.3
>> All workstations proxy settings are 172.30.0.3:8080
>>
>> The proxy settings are working fine for blocking content, however, I
>
> Does it mean that the proxy server gives restricted access to the Int=
ernet
> for the machines behind it? Can they access the sites like google.com=
 (or
> whatever sites allowed)?
>
>> am having the following issues:
>>
>> The school's web server is hosted locally. When the workstations try
>> to access the site via the public domain name, it fails.
>
> If the answer is 'yes' to the above questions, your machines should b=
e able
> to access the school website as well, through the public IP.
>
> Please ensure that the machines in the LAN are not bypassing the prox=
y for
> your school website. Because, we tend to bypass proxy for the school =
website
> (in the browser settings), as it is hosted internally (on your LAN, p=
robably
> on the same machine where squid is running).
>
> Bypassing proxy works, if the Domain Name of your school website is r=
esolved
> into the local address. But, in your case, the Domain Name is getting
> resolved into the public address. So, it should ideally go through th=
e proxy
> server.
>
> Also check, is there any existing iptables rule which is dropping pac=
ket
> from your proxy server to your webserver (even if they are on the sam=
e
> machine), unintentionally.
>
>
> Regards,
> Vignesh
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
