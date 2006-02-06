From: afshin lamei <afshinlamei@gmail.com>
Subject: iptables matching method
Date: Mon, 6 Feb 2006 13:48:24 +0330
Message-ID: <3115d56e0602060218s2ad8ed82ie5ffc03c5d6931bb@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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

Dear all,
I have a question about the way netfilter matches the fields in a
rule. for example in :
iptables -A FORWARD -p tcp -m condition --condition myweb -m string
--string 'test' -j DROP
there are 3 fields: protocol:tcp, condition:myweb and string: 'test' .
if these 3 fields are matched serially ( one bye one ), then we will
not pay the cost of string matching for none-tcp packets, also if the
"myweb" condition is off again we have not to concern the string
matching overhead.
But if they are matched in parallel, then we will pay the cost of
string matching for all packets.
Does any one no which method (serial or parallel) is really used by netfilt=
er?
regards
afshin lamei

