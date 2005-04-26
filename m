From: Tobias DiPasquale <codeslinger@gmail.com>
Subject: Re: difference between DROPped pings and non existing hosts
Date: Tue, 26 Apr 2005 14:16:14 -0400
Message-ID: <876ef97a05042611161428df43@mail.gmail.com>
References: <426E8530.6080203@lopsch.com>
Reply-To: Tobias DiPasquale <codeslinger@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <426E8530.6080203@lopsch.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: Daniel Lopes <lopsch@lopsch.com>
Cc: netfilter@lists.netfilter.org

On 4/26/05, Daniel Lopes <lopsch@lopsch.com> wrote:
> I would like to know how ICMP distinguishes between DROPped pings and
> non existing hosts. Both times you don=B4t get a reply from the
> destination host but if it doesn=B4t reply because it doesn=B4t exist you
> get the correct destination unreachable message if it drops the requests
> for example with IPTables you get a timeout. And I haven=B4t a clue why
> this is so.

In the case where you get a destination unreachable message back, its
the router that is responsible for the network on which the machine
you are trying to ping that is responding with that message. When ICMP
is dropped, the packet makes it to the host and thus the router does
not generate a destination unreachable message to send back to you.

--=20
[ Tobias DiPasquale ]
0x636f6465736c696e67657240676d61696c2e636f6d

