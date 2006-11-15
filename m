From: "Vladimir Iskoz" <Vladimir.Iskoz@alvarion.com>
Subject: Can not run iptables
Date: Wed, 15 Nov 2006 17:39:21 +0200
Message-ID: <A656C409D135BD44A5901A88AD851E5E04B174@tlvex02.alvarion.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: "Netfilter (E-mail)" <netfilter@lists.netfilter.org>

Hi all,
I'm really new to uClinux and Netfilter and trying to run it.
My target is ARM
Kernel: linux-2.6.14
GNU 3.4.5
Cross compiler - Buildroot.
Buildroot produces the file system that is loaded to flash while kernel image is loaded to RAM using TFTP.
I'm trying to add the Netfilter to the kernel using menuconfig.
It seems to be OK and I received zImage for loading on target.
After loading the image I'm trying to run some iptables command but receive that 
iptables: applets not found (or file not found)
It seems that I'm running it from wrong place, I don't know.
I see that Ip tables package is configured (may be partially) according to some prints during initialization. 
What can I check (do) to clear the situation?

Thank you very much for your help and time

Vladi



 
 
************************************************************************************
This footnote confirms that this email message has been scanned by
PineApp Mail-SeCure for the presence of malicious code, vandals & computer viruses(42).
************************************************************************************




