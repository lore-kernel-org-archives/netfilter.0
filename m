From: Peteris Krumins <newsgroups@lf.lv>
Subject: mark match
Date: Sat, 29 Mar 2003 15:25:52 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <190389138671.20030329152552@lf.lv>
Reply-To: Peteris Krumins <newsgroups@lf.lv>
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

hi,

 what's the point of mask in the mark match?
 
 for example, i want to match anything marked from 1 (1b) to
 127 (1111111b), is it possible to do it using a mask?

 nfmark    mask    match
 1      &  127  =  1
 77     &  127  =  77

 i see no point in mask.
 could anyone explain the use of mask to match multiple nfmarks?

P.Krumins


