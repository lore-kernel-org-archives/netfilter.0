From: Peteris Krumins <newsgroups@lf.lv>
Subject: psd and active ftp mode
Date: Wed, 9 Apr 2003 03:22:10 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <136459744507.20030409032210@lf.lv>
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

hello,

 i was just testing psd match and w/ ftp active mode.

 I created 10000 files on the ftp server and set my ftp client to
 active mode and let it download those files while having
 `iptables -A INPUT -p tcp -m psd -j REJECT --reject-with tcp-reset`
 (with psd default threshold/weigh values).
 The psd matched 3136 packets.

 Ftp server went mad issuing:
  425: Unable to build data connection: Connection refused

 This means i cannot relay on psd and block 'possible portscans'?
 Any suggestions?

 The same would happen, if i created some rules with limit match..

 
P.Krumins


