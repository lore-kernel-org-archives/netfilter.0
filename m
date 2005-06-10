From: Filip Sneppe <filip.sneppe@gmail.com>
Subject: Re: Why do I have 'MARK' all over my logs?
Date: Fri, 10 Jun 2005 13:02:39 +0200
Message-ID: <9151ac2a05061004025b3453e8@mail.gmail.com>
References: <BAY0-SMTP07EE697B166AFFF0DFD5FFBCFF0@phx.gbl>
Reply-To: Filip Sneppe <filip.sneppe@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY0-SMTP07EE697B166AFFF0DFD5FFBCFF0@phx.gbl>
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
To: CompuGenic <pablo@compugenic.com>
Cc: netfilter@lists.netfilter.org

Hi,

On 6/10/05, CompuGenic <pablo@compugenic.com> wrote:
> Hello all.
...
> However, my logs are constantly filled with entries as follows:
> Jun 9 8:51:12 host -- MARK --
> Jun 9 9:11:12 host -- MARK --
> Jun 9 9:31:12 host -- MARK --
> Jun 9 9:51:12 host -- MARK --
> Jun 9 10:11:12 host -- MARK --
> Jun 9 10:31:12 host -- MARK --
>=20
> Notice the time patterns? I have no idea where these are coming from? Is

These are from syslog - notice how they are logged every 20 minutes,
when syslog has gone 20 minutes without receiving a message for
this log file.

Let's say your machine crashes overnight. At the very least you may be
able to pinpoint when the machine crashed (within a 20-minute interval)
thanks to these messages :-)

Regards,
Filip

