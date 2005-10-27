From: Marcin Giedz <marcin.giedz@eulerhermes.pl>
Subject: question
Date: Thu, 27 Oct 2005 09:55:20 +0200
Message-ID: <200510270955.20466.marcin.giedz@eulerhermes.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

Hi,


I'd like to ask if it possible to change "data" field (its content) in TCP 
packet on fly? I don't need to change data's lenght but only change few bytes 
in it.

Example:
0000  ff ff ff ff ff ff 00 11 25 31 ad e0 08 00 45 00   ........%1....E.
0010  00 c1 0a b1 00 00 80 11 82 0f ac 13 01 59 ff ff   .............Y..
0020  ff ff 04 2d 01 db 00 ad 60 78 ad a7 5b de 9f 26   ...-....`x..[..&
0030  ec 98 2d 26 ec 18 2d 26 ec 18 2d 26 ec 18 2d 26   ..-&..-&..-&..-&
0040  ec 18 2d 26 ec 18 2d 26 ec 18 2d 26 ec 18 2d 26   ..-&..-&..-&..-&

First line contains MAC address 00:11:25:31:ad:e0 - I need to change it to 
other value. 

Is it possible at all?

Marcin

