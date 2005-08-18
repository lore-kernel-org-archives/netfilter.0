From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: kernelthreads and -m owner
Date: Thu, 18 Aug 2005 17:49:28 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0508181747350.1090@yvahk01.tjqt.qr>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter User Mailing List <netfilter@lists.netfilter.org>

Hello list,


to put it straight: I have found that kernel threads (read: nfsd) do not
match --uid-owner 0, i.e. have the same issue as e.g. ICMP messages (as
said in the OWNER part of the manpage).

Is there any way to match these sort of packets without using
port ranges? 2049 is not always true..



Jan Engelhardt
-- 
| Alphagate Systems, http://alphagate.hopto.org/

