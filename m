From: "Steven Mugassa" <steven.mugassa@intafrica.com>
Subject: Help needed-How to install CIPE
Date: Mon, 12 May 2003 08:57:31 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c3184b$611250f0$0223a8c0@satconet.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0001_01C31864.865F88F0"
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
To: netfilter-admin@lists.netfilter.org
Cc: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------=_NextPart_000_0001_01C31864.865F88F0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit



> Hi everyone,
> 
> I want to connect two remote LANs using CIPE VPN. I have two Linux
> machines (with Red hat 9) one on each LAN, which are installed with
> CIPE-1.4.5-16. The set-up is as illusrated below
> 
> LAN A=192.168.3.0/24-------|LINUX A(with CIPE)|
> <------------VPN------------>|Linux B(with CIPE)|--------LAN
> B=192.168.4.0/24
>                                         |eth0=public A
> |eth0=public B
>                                         |eth1=192.168.3.1
> |eth1=192.168.4.1
>                                         |cipcb0=10.0.0.1
> |cipcb0=10.0.0.2
> 
> Both LANs are using static IP addresses which are SNATed to public IP for
> accessing outside world 
> 
> I am new to CIPE, and i was trying to install using the document shipped
> with RedHat 9 (RedHat 9 doc, Security Guide).
> During installation, i come across many difficulties as outlined below:
> 
> -In the directory /etc/cipe there are some files which need to be edited,
> i copied file 'options' to 'options.cipcb0' and then editing the
> 'options.cipcb0' file as follows
>   ptaddr=cipcb0 of remote Linux router. i.e for LINUX A, ptpaddr=10.0.0.2
> and for LINUX B, ptpaddr=10.0.0.1
>   ipaddr=its cipcb0.i.e, LINUX A has 10.0.0.1 and LINUX B has 10.0.0.2
>   me=eth0
>   peer= 'eth0 of remote Linux router':port whereby i used port 6060 which
> is the default port given in the file 'redhat-ifcfg-cipcb0'
> - What i don't understand in this file are these ports, as in the sample
> files i have seen ports 6789, 6543, 6060, and 6969(in the documentation
> i'm reffering). So, which port should i define in 'peer', and which in
> 'me'?
> -Also i'm not sure with the addresses i'm using for peer & me, are they
> correct?(since in the CIPE examples i have seen they use dynamic ip
> addresses for internal LAN, so me becomes 0.0.0.0. While in my case the
> intarnal Ip addresses are static)
> 
> -Another problem is regarding the interface cipcb0. after creating this
> interface it stood on top of eth0 when i do 'ifconfig' command. is this
> normal, as i created it by just copying the contents of
> redhat-ifcfg-cipcb0 to ifcfg-cipcb0 (in the
> /etc/sysconfig/network-scripts).. So, my ifcfg-cipcb0 has these entries:
>    device=cipcb0; onboot=yes; userctl=yes; myport=6060 peer=public of
> remote:6060; ptpaddr & ipaddr.
>   When i do ifconfig i get the following as some of the entries for
> cipcb0:
>       Link encap: IPIP Tunnel HWaddr
>       inet addr: 10.0.0.1 P-t-P: 10.0.0.2 mask: 255.255.255.255
>       UP POINTOPOINT NOTRALERS RUNNING NOARP MTU: 1442 Metric: 1
>  According to these info, did i created the cipcb0 interface clearly?
> 
> Well, so many questions but it is not easy to explain them on a sheet of
> paper. Even, i'm not sure if i have managed to explain  clearly the
> problems i'm facing. If you have understood these questions, then thank
> you, however even if they are not clearly explained, please understand
> that what i need to know is how to install and keep CIPE up and running
> for the setup that i have (LANs are using static IPs and not dynamic)
> 
> Thank you 
> Steven
> 
> 

------=_NextPart_000_0001_01C31864.865F88F0
Content-Type: application/ms-tnef;
	name="winmail.dat"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="winmail.dat"

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
V0hJAAAAAKp/

------=_NextPart_000_0001_01C31864.865F88F0--


