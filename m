From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: RE: ..prevention, was: syn DDoS attack solution
Date: Thu, 14 Jun 2007 15:43:46 -0400 (EDT)
Message-ID: <Pine.LNX.4.64.0706141541020.9595@darkstar.sysinfo.com>
References: <5C9E8CCEEB81ED498AC0C3B0054704F302A8427E@webmail.latis.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <5C9E8CCEEB81ED498AC0C3B0054704F302A8427E@webmail.latis.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Martin McKeay <mmckeay@stillsecure.com>
Cc: Arnt Karlsen <arnt@c2i.net>, netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Wed, 13 Jun 2007, Martin McKeay wrote:

> I'm not directly involved in the firewall for the corporation in my
> current postion, but as the Security Manager at my last employer, one of
> the things we did was set up a schedule of regular firewall reviews by a
> committee consisting of the firewall admin, the network admin and
> myself. We had a check list of the minimum requirements for the
> firewalls, including the bogons and a final deny all rule.  It was a
> e-commerce software/hosting company, so we had over 30 firewalls we
> managed.  Our entire IT department, including myself and the IT Director
> was 7 people, so you can guess this wasn't something people liked making
> time for, but it saved us a more than once when someone had made a
> mistake in the firewall configuration.
>
> I like the idea of an automatic update, but I think it's more important
> to have regular peer review of the firewall configuration.  It's worked
> well for me in the past
>


That's kinda a lame cop-out for not wanting to update your online 
documentation and work up some scripts to accompany it.  Such a review 
does not have to negate an automated function to deall with blocking bogon 
blocks nor spam controls.  And automating such tasks is a good way to make 
sure rules and info are uptodate and currnet, even prior to a review.


Thanks,

Ron DuFresne
- -- 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         admin & senior security consultant:  sysinfo.com
                         http://sysinfo.com
Key fingerprint = 9401 4B13 B918 164C 647A  E838 B2DF AFCC 94B0 6629

...We waste time looking for the perfect lover
instead of creating the perfect love.

                 -Tom Robbins <Still Life With Woodpecker>
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iD8DBQFGcZp1st+vzJSwZikRAuv+AKDRGgGHaO010LFNxEqB5lYQoFzY4QCdEA4L
5QXNf/5/W6UUAyGLgH7O7+M=
=uzzl
-----END PGP SIGNATURE-----

