From: skuda <skuda@betanetgeb.com>
Subject: streaming problem
Date: 10 Sep 2002 22:24:15 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1031698631.3224.7.camel@skuda.betanetgeb.com>
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
To: netfilter@lists.samba.org

hi all :), i have a problem, i have 2 servers, with linux and apache
1.3.26 in it, one (A) have a slow connection 64kbit isdn, and the other
(B) have a fast connection 100mbit, in A i have motion
(http://motion.technolust.cx/)sharing a webcam in port 8001 and a java
applet (cambozola) to show in the index of the webserver the camera in
real time, i would like connect the fast (B) to the slow connection (A) 
and share with many people this camera without open more than one 
connection from (B) to (A), because  bandwith is too little to open many
connections with B. Do you know any solution to this problem? thanks in
advance



