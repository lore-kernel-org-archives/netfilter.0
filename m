From: "Jason Sigurdur" <Jason.Sigurdur@aspenview.org>
Subject: programicly inserting rules
Date: Wed, 3 May 2006 10:51:44 -0600
Message-ID: <648A21EA469E3848922D9860785CD5EF23D4B0@aspen-mail01.aspenview.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
To: netfilter@lists.netfilter.org

I need some suggestions for programicly inserting and deleting iptable
rules. I have seen some mentions of using libiptc. Would It be possible
to
Make libiptc a shared library and use JNI?


Regarding Inserts; If I had the following:
Forward chain
Rule 1 state
Rule 2 forward accept
Rule 3 log
Rule 4 drop

If I made multiple inserts to position 4, would the relative positions
of 1,3,4 remain? Or should I just make rule2 a jump to a different chain
where the inserts would happen?

Thx jason

