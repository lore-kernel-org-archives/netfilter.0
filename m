From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: How do I use Iptables to redirect URL
Date: Tue, 12 Dec 2006 09:14:55 +0100 (CET)
Message-ID: <1144.193.173.119.247.1165911295.squirrel@webmail.sterenborg.info>
References: <20061212075455.M77462@mail.uma.org.tw>
	<20061212075919.M9349@mail.uma.org.tw>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20061212075919.M9349@mail.uma.org.tw>
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

On Tue, December 12, 2006 08:59, shaofeng wrote:
> When somebody connect to host A and the URL is
> "http://www.A.com/A.htm".
> I want to redirect to the request to host B and change the URL as
> "http://www.B.org/B.htm"
> How do I set the iptables rule.

You cannot redirect an url using iptables.
You can do that in Apache or, if it should be done before apache, in Squi=
d.


Grts,
Rob



