From: "Arnst, Rainer" <Rainer.Arnst@ee-consultants.de>
Subject: IPSec Transport Mode
Date: Wed, 07 Jul 2004 15:35:05 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1089207305.788.14.camel@PCA-ARNSTR.ee-consultants.de>
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
To: NetFilter Mailling List <netfilter@lists.netfilter.org>

Hello,

I have a question regarding IPSec in Transport Mode and IPTables. I must
admitted my knowledge concerning IPSec is quite limited and so far what
I have heard about IPSec's transport and tunnel mode is not really clear
to me.

Setup is like this:

The Firewall (iptables - ipcop) has a fixed IP, the Client (MS Windows
XP) has a dynamic IP. IPSec Server is a Windows 2003 Server Box.

IPSec-Client (Internet) --> Firewall --> IPSec Server (internal)

Usually, as far as I understand, transport mode is not an option here
because of NAT being performed by the "Firewall"/Gateway.

Using MS NAT-T works fine, but we want to switch to something non-MS
soon (hopefully real soon). So it's not really an option.

With this Setup, is there anything that can be done with IPTables to
make the transport mode work w/o NAT-T?

Any comments are very appreciated.

Regards,
Rainer Arnst


