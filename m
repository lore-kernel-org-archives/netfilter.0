From: Torge Szczepanek <netfilter@szczepanek.de>
Subject: Re: Filtering Nimda, Code Red and Code Red II
Date: 12 Sep 2002 08:38:15 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1031812695.1954.16.camel@cygnus.szczepanek.de>
References: <Pine.LNX.4.33.0209091917581.31845-100000@panda.center-f1.ru>
	<3D7EFBCF.70406@fugmann.dhs.org> 
	<00a601c259ee$57f815c0$6500a8c0@systemsadmin>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <00a601c259ee$57f815c0$6500a8c0@systemsadmin>
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
To: netfilter@lists.samba.org

Am Don, 2002-09-12 um 01.52 schrieb Joe de Vera Jr.:
> can i make use of the iptables scripting to disable the access pages... for
> example for code red it access /default.ida page while in nimda /root.exe
> and cmd.exe
> 
> is there a way to dis allow this..

Compile in String Matching support.

Then do the following:

IPTABLES="/usr/sbin/iptables"

$IPTABLES -A INPUT -p tcp -i eth0 --dport 80 -m string \
               --string "/default.ida" -m state --state ESTABLISHED \
                       -j REJECT --reject-with tcp-reset

$IPTABLES -A INPUT -p tcp -i eth0 --dport 80 -m string \
               --string "/cmd.exe" -m state --state ESTABLISHED \
                       -j REJECT --reject-with tcp-reset
   
On a router/firewall replace INPUT by FORWARD and also adjust the -i and
or -o parameter.


