From: Daniel Lopes <lopsch@lopsch.com>
Subject: difference between DROPped pings and non existing hosts
Date: Tue, 26 Apr 2005 20:15:12 +0200
Message-ID: <426E8530.6080203@lopsch.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,


I would like to know how ICMP distinguishes between DROPped pings and=20
non existing hosts. Both times you don=C2=B4t get a reply from the=20
destination host but if it doesn=C2=B4t reply because it doesn=C2=B4t exi=
st you=20
get the correct destination unreachable message if it drops the requests=20
for example with IPTables you get a timeout. And I haven=C2=B4t a clue wh=
y=20
this is so.

