From: "Vijay Angelo" <vijay.angelo@indscape.com>
Subject: please help  me.......
Date: Fri, 19 Sep 2003 14:25:03 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000101c37e8b$b7342e30$1d01a8c0@pdcindscape.com>
Reply-To: <vijay.angelo@indscape.com>
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

hi
 I m one among the member of this list ,i have a problem with
libiptc...please look after if u can do it.
 I want to insert one rule using the iptc_insert_entry function in
libiptc....
 As i m new to netfilter ,libiptc ..i m struggling  a lot..i hope u can help
me .

 Just give me an information about how to fill the target information in the
ip_entry structure ...and the  i  target_offset field ...

    I want insert a rule like..
  -t nat -A PREROUTING   -s 192.45.23..1 -p icmp -j DROP

  please help me on how to fill the structure and invoke the function.
  I m eagerly expecting your reply...

  thanking you
  vijay



