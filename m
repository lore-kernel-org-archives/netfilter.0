From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: Dynamic DNS
Date: Wed, 9 Mar 2005 17:35:29 -0500 (EST)
Message-ID: <Pine.LNX.4.60.0503091729300.11874@darkstar.sysinfo.com>
References: <20050309062542.GA27660@gw.home.tux-labor.de>
	<422E97C3.7040009@eccotours.dyndns.org>
	<fad9d48405030900048e01e6a@mail.gmail.com>
Mime-Version: 1.0
In-Reply-To: <fad9d48405030900048e01e6a@mail.gmail.com>
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
To: Kenneth Kalmer <kenneth.kalmer@gmail.com>
Cc: Brent Clark <bclark@eccotours.dyndns.org>, netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Wed, 9 Mar 2005, Kenneth Kalmer wrote:

> On Wed, 09 Mar 2005 08:29:23 +0200, Brent Clark
> <bclark@eccotours.dyndns.org> wrote:
>> Sebastian Docktor wrote:
>>> Hi,
>>>
>>> I want to allow a Dynamic DNS Client to Access the SSH-Server
>>> on my Firewall. But I don't want to open SSH for all IPs,
>>> Is it possible that iptables always looks up the ip address from the
>>> hostname, so that only the ip has access which is registrated under
>>> the dyndns?
>>>
>>>
>>
>> Hi
>>
>> This may be a ridiculous suggestion.
>>
>> How about basing it on MAC address.
>>
>> Stupid I know.
>>
>> Buts all I could think off.
>>
>> Brent Clark
>>
>>
>
> I'm not too sure either, but I do know that iptables resolve the names
> the moment the rule is added, not again. Unless you run the rule every
> minute to make sure it's updated constantly.
>
> Can't you setup SSHD to only allow connections from certain hosts?
> Then again sshd might use the reverse lookup of the ip, which isn't
> always the dyndns name...
>
> Will you let us know how you achieve this?
>
>

Most systems, at least linux based dists now have ssh compiled with tcpd 
support <also, ssh did, and still should have an acce3ss list allowed in 
the sshd_config file, unless that was removed in openssh due to the tcpd 
issues>, so the way I might deal with this is to only allow the dynamic 
apddress space through via a hosts.allow file with a default deny all in 
hosts.deny for sshd. Actually, since all the access to/through my firewall 
comes from static IP's, I do this in both tcpd and iptables with a list of 
allowed hosts at present and in the recent past.  This give me two layers 
of protection should the firewall be taken down, or not comeup and all 
that.


This issue is easiest if you know up front what the dyn address space 
consits of <you control the dynaic address space>, it is tougher if one 
has to guess at the low and top ends of what addresses might get passed to 
systems on boot.

Thanks,

Ron DuFresne
- -- 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         admin & senior security consultant:  sysinfo.com
                         http://sysinfo.com

...Love is the ultimate outlaw.  It just won't adhere to rules.
The most any of us can do is sign on as it's accomplice.  Instead
of vowing to honor and obey, maybe we should swear to aid and abet.
That would mean that security is out of the question.  The words
"make" and "stay" become inappropriate.  My love for you has no
strings attached.  I love you for free...
                         -Tom Robins <Still Life With Woodpecker>
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFCL3o0st+vzJSwZikRAu5RAJ9eOStR8ujT7TFthrJ2SXmElndCrACgyjFt
jm3SWenK9jyHU1NQ7xHNLA0=
=TXR9
-----END PGP SIGNATURE-----

