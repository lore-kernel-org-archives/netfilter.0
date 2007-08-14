From: Ray Leach <spoons@rchq.co.za>
Subject: Re: Capitalization conflicts in netfilter code apparently break
 tortise subversion
Date: Tue, 14 Aug 2007 21:07:54 +0200
Message-ID: <46C1FD8A.4050804@rchq.co.za>
References: <20070814173337.GA9922@freya.hsd1.ca.comcast.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------020500000002010003000409"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20070814173337.GA9922@freya.hsd1.ca.comcast.net>
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
To: "Adam J. Richter" <adam@yggdrasil.com>
Cc: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.
--------------020500000002010003000409
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



Adam J. Richter wrote:
> 	I am sorry if this is a frequently raised topic, but I have
> done some web searches for it, including ones limited to
> netfilter.org, and looked through the past few months of mailing list
> archives without finding anything about it.
>
> 	netfilter appears to be the only part of the linux kernel that
> contains file names that differ only by capitalization.  I infer from
> a quick glance at the source tree that the netfilter code currently
> uses the caplitation to distinguish between "targets" and "matches",
> which I would assume somehow helps in the readability of iptables
> output or something like that.
>
> 	File names that collide when compared case insensitively
> result in errors in the use of TortoiseSVN on Windows clients using a
> subversion source tree that has a copy of the linux kernel checked in.
>
> 	Although I would welcome tips about some kludge available in
> TortoiseSVN to work around this problem so that I don't have to admit
> that Linux is incompatible with the primary client of this particular
> company's chosen version control system, and have found some
> discussion of this subversion issue on the net already, the primary
> point of my letter is that file names that differ only in
> capitalization in the real world do add a little bit to costs of and
> potential arguments against linux.  Incompatability with our
> colleagues' case insensitive file systems also impedes software
> sharing minutely and may erode the inclination of others to accomodate
> conventions that may make our lives easier (7 bit characters in file
> names, no spaces, control characters, slashes, semicolons, no files
> named "..", etc.).
>
> 	I don't expect the netfilter contributors immediately to jump
> and fix this problem, which I imagine would have implications in user
> level code and system administration scripts.  Rather, I submit it for
> contributors to contemplate in future planning.  For example, perhaps
> in the future, the FILTERNAME/filtername convention could be migrated
> to the use of suffixes like filtername_in/filtername_out.
>
> 	Thanks for your time.
>
> Adam Richter
>
>
>
>
>   

Thanks Adam

This appears to be an OS specific and not a subversion issue. The 
subversion server allows you to check in duplicate filenames with 
different case. The problem comes in when you try and check the code out 
again on an OS which is case insensitive (ala Windows). See this link on 
the Tigris website for more info :
http://subversion.tigris.org/servlets/ReadMsg?listName=dev&msgNo=38144

Bottom line is, if the code was checked into the repository 
successfully, then it would have been done from a client on an OS that 
supports case sensitivity and probably was expected to be checked out on 
a compatible OS.

Regards

Ray

-- 
<img src='http://www.danasoft.com/sig/spoonssig.jpg' />
--------------------------------------------------
RCHQ Hobbies cc
http://www.rchq.co.za and http://store.rchq.co.za
Fax: +27 86 652 2773       eMail: admin@rchq.co.za
P O Box 10376, Vorna Valley, Midrand, 1686
--------------------------------------------------


--------------020500000002010003000409--

