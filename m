From: dhiraj.2.bhuyan@bt.com
Subject: IPSec passthrough
Date: Tue, 27 May 2003 16:44:31 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7497DCA1C240C042B28F6657ADFD8E092687C0@i2km11-ukbr.domain1.systemhost.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Dear List,
Does anyone know whether there is patch that will allow kernel 2.4 or
greater to support setting up of multiple IPSec tunnels (passthrough) to the
same destination - ie more than one machine behind the firewall trying to
set up IPSec tunnel to the "same" remote host? When I was testing kernel
2.4.20 for passthrough capability a few months back, there was no patch that
would allow me to do that (single passthorough worked fine). I presume this
has something to do with writing a conntrack IPSec helper?
Regards,
Dhiraj Bhuyan
BTexact

