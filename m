From: "Thomas Raef" <traef06@ebasedsecurity.com>
Subject: RE: blocking IPs by file
Date: Thu, 1 Sep 2005 19:01:05 -0500
Message-ID: <D2EA20593E6AAD4DA6D07DE0EC12D1616307@ebs-2200.ebasedsecurity.com>
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
To: "curby ." <curby.public@gmail.com>
Cc: netfilter@lists.netfilter.org

I'm just looking for something that's considered the "best way".

Thank you for the comment about using a custom chain. That makes sense.

-----Original Message-----
From: curby . [mailto:curby.public@gmail.com]=20
Sent: Thursday, September 01, 2005 7:00 PM
To: Thomas Raef
Cc: netfilter@lists.netfilter.org
Subject: Re: blocking IPs by file

On 9/1/05, Thomas Raef <traef06@ebasedsecurity.com> wrote:
> What's the best way to block a list of IP addresses from a text file?

I'm not sure if you're looking for an existing solution or want to
script your own.  If you want to make one, it's good to use a custom
chain because then you can easily add to it without reloading the
entire firewall or taking pains to find out where in the list of rules
you need to insert.

