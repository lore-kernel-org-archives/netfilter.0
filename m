From: "William L. Childers" <childew@cox.net>
Subject: Newbie Question
Date: 21 Oct 2002 21:47:28 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1035254854.1764.16.camel@develop.wlc.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

All,

	I have a network with 4 computers behind the firewall.  Three of these
are workstations.  The firewall works fine for these.  Here is the fun
part.  

One of the computers is a server with the Windows 2000 Operating System
installed.  It is running IIS, and a mail server.  The SMTP portion of
IIS is configured to send email out on port 1125.  I have DNAT working
for the WEB server and SMTP.  There is, however, an issue with one of
the applications that is running on the web server.  It will not send
email out on port 1125.  The rules that I am trying to get to work are:
## Outgoing SNAT Port 1125 only
$IPTABLES -A PREROUTING -t nat -i $INTERNALIF -p tcp --sport 1125 -j
SNAT --to $MYADDR

$IPTABLES -A FORWARD -i $INTERNALIF -p tcp -d 192.168.0.4 --sport 1125
-j ACCEPT

$INTERNALIF is the Private Interface
$MYADDR is the Public IP Address

192.168.0.4 is the Private IP of the IIS Server 

Thank you in advance for any assistance that you may be able to provide.

Bill




