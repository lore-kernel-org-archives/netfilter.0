From: "rohit_linux" <rohit_linux@indiatimes.com>
Subject: Iptables Port forwarding Problem
Date: Tue, 06 May 2003 14:32:31 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200305060817.NAA07652@WS0005.indiatimes.com>
Reply-To: "rohit_linux"<rohit_linux@indiatimes.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	   boundary="=_MAILER_ATTACH_BOUNDARY1_2003562143231719885386"
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
To: netfilter@lists.netfilter.org

--=_MAILER_ATTACH_BOUNDARY1_2003562143231719885386
Content-Type: text/plain; charset=us-ascii

Hi Friend's


I need help on Iptables port forwarding .


i configured my linux box with 2 nic's


OS          Redhat 8.0


iptables enabled.


eth0=x.x.x.x.x/255.255.255.252(Live IP)(external interface)on which site is hosted .


eth1=192.168.0.120/255.255.255.0(internal interface)


Used gSheild package for firewalling.


PORT 80,25 are forwarded to internal lan machine 192.168.0.1


from outside i can access my WebServer and Mailing services.


but LAN machines are not able to access the webservices 


scenario is like 


192.168.0.10 ------&gt;x.x.x.x:80   -------&gt;192.168.0.1:80


i get the error 


"(111) Connection refused"


so friend's i need your help on this.


Rohit
Get Your Private, Free E-mail from Indiatimes at  http://email.indiatimes.com
Buy The Best In BOOKS at http://www.bestsellers.indiatimes.com
Bid for Air Tickets @ Re.1 on Air Sahara Flights. Just log on to http://airsahara.indiatimes.com and Bid Now !

--=_MAILER_ATTACH_BOUNDARY1_2003562143231719885386
Content-Type: text/html; charset=us-ascii

<P>Hi Friend's</P>
<P>I need help on Iptables port forwarding .</P>
<P>i configured my linux box with 2 nic's</P>
<P>OS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Redhat 8.0</P>
<P>iptables enabled.</P>
<P>eth0=x.x.x.x.x/255.255.255.252(Live IP)(external interface)on which site is hosted .</P>
<P>eth1=192.168.0.120/255.255.255.0(internal interface)</P>
<P>Used gSheild package for firewalling.</P>
<P>PORT 80,25 are forwarded to internal lan machine 192.168.0.1</P>
<P>from outside i can access my&nbsp;WebServer and Mailing services.</P>
<P>but LAN machines are not able to access the webservices </P>
<P>scenario is like </P>
<P>192.168.0.10 ------&gt;x.x.x.x:80&nbsp;&nbsp; -------&gt;192.168.0.1:80</P>
<P>i get the error </P>
<P>"(111) Connection refused"</P>
<P>so friend's i need your help on this.</P>
<P>Rohit</P>
<hr><font face="Arial" size="2"><b>Get Your Private, Free E-mail from Indiatimes at  </font><a href="http://email.indiatimes.com"><font face="Arial" size="2">http://email.indiatimes.com</a></b><br>Buy The Best In <b>BOOKS</b> at <A href="http://www.bestsellers.indiatimes.com">http://www.bestsellers.indiatimes.com</A><br>Bid for <b>Air Tickets @ Re.1</b> on Air Sahara Flights. Just log on to <a href="http://airsahara.indiatimes.com">http://airsahara.indiatimes.com</a> and Bid Now !</font>

--=_MAILER_ATTACH_BOUNDARY1_2003562143231719885386--


