From: Luke Reeves <luke@neuro-tech.net>
Subject: Multiple VPN connections behind NAT - revisited
Date: Mon, 26 Apr 2004 05:14:08 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <408CD2E0.3070007@neuro-tech.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter <netfilter@lists.netfilter.org>

I've dug through the list archives and found many people having problems 
with multiple VPN clients attempting to make connections from behind a 
NAT'ed connection.  The patch-o-matic includes a new module for 
netfilter concerning this, yet it seems to be specific to the 2.4.x 
series of kernels.

The server I've setup in a corporate environment is a Debian GNU/Linux 
system on a relatively new server.  Due to the motherboard chipset and 
ACPI BIOS the kernel of choice is 2.6.5, and I'm using the machine to 
masquerade connections for several client PCs (Windows XP).  I'd like to 
figure out how to do this with the newer kernel.  Thanks in advance,

	Luke Reeves
	http://www.neuro-tech.net/

