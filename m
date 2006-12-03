From: "Joris Dobbelsteen" <Joris@familiedobbelsteen.nl>
Subject: Traffic auditing per user
Date: Mon, 4 Dec 2006 00:11:17 +0100
Message-ID: <73427AD314CC364C8DF0FFF9C4D693FF544D@nehemiah.joris2k.local>
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

I'm looking for a solution to audit network traffic usage per user.
After a long enough search I was not able to find a solution that suited
my needs.

It must fit the following requirements:
* The traffic must be logged on a uid basis.
* Some traffic should not be counted, which is protocol (i.e. non-IP)
and IP address based (i.e. no local network).
* Of course not have a dramatic effect on performance

Hopefully its not to hard for me, thus the tool has some (decent)
instructions/documentation.
Further I want to keep using my stock application. The platform is
Ubuntu 6.06 LTS, and I prefer to have the packages from the
repositories, rather than my own complications. Mostly for reasons of
testing and maintenance.

I would guess this is not directly a netfilter question, but it should
be close enough.

- Joris

