From: Tommy McNeely <Tommy.McNeely@Sun.COM>
Subject: Re: Subject: Re: Making this list more readable
Date: Wed, 08 Jan 2003 17:52:42 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <90760000.1042073562@leverage>
References: <3E1CB63C.9090602@aut.ac.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <3E1CB63C.9090602@aut.ac.nz>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ian Batterbee <ian.batterbee@aut.ac.nz>, netfilter@lists.netfilter.org
Cc: Athan <netfilter@miggy.org>, Carol Anne Ogdin <caogdin@deepwoods.com>

All those Mic*ft mailers that send that html email :p maybe the listserv 
could reject it :) or at the very least, select the ascii attachment (that 
usually comes along with it)..



--On Thursday, January 09, 2003 12:37:32 PM +1300 Ian Batterbee 
<ian.batterbee@aut.ac.nz> wrote:

>>
>>
>> Content-Type: text/plain; charset=us-ascii
>> Content-Disposition: inline
>> Content-Transfer-Encoding: quoted-printable
>>
>> On Wed, Jan 08, 2003 at 08:59:16AM -0800, Carol Anne Ogdin wrote:
>>
>>
>>>>    Is there any way to change the listserv so it doesn't convert
>>>>    control characters (e.g., tabs, quotes and spaces at ends of lines)
>>>>    to '=3Dxx' form of hex characters.  It's hard to read.  (I read the
>>>>    digest, so perhaps the problem lies there, and not in the main
>>>>    listserv?) Does your listserv software have a conversion table you
>>>>    can set that will make things more readable?
>>>
>>>
>>
>>  I don't see this, and I'm getting the list direct.  The =3DXX thing is
>> "Quoted Printable" encoding.  Probably an option on the listserv to turn
>> it on/off for the digest.
>>
> I see the problem as well.. I think it's caused by the fact that many of
> the individual messages in the  are content-transfer-encoding:
> quoted-printable, but the digest has no content-transfer-encoding in the
> header, so the quoted-printable data inside the messages included in the
> digest is treated as plain text and incorrectly formatted.
>
> If we know that ALL messages contained in the digest are
> quoted-printable, then it would just be a matter of changing the
> content-type of the digest, but I've noticed the problem doesn't occur on
> all messages.. some are fine.. so...  I guess people's mailers are simply
> posting as quoted-printable, and the digest process is just including the
> message body as-is
>
>
>
>



--
Tommy McNeely         --        Tommy.McNeely@Sun.COM
Sun Microsystems - IT Ops - Broomfield Campus Support
Phone:  x50888 / 303-464-4888  --  Fax:  720-566-3168


