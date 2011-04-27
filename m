From: Mike Hendrie <mike@hendrienet.com>
Subject: Re: Proxy Filter iptable Settings
Date: Wed, 27 Apr 2011 06:26:37 -0500
Message-ID: <BANLkTikUnSoefT3Xy=O+43zWGEw3tgb7wQ@mail.gmail.com>
References: <BANLkTin=W-MWbPfrpqnmWDCMq9fGp5CvwQ@mail.gmail.com>
	<1303885014.18916.10.camel@andybev-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1303885014.18916.10.camel@andybev-desktop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Andrew Beverley <andy@andybev.com>
Cc: netfilter@vger.kernel.org

Thanks for the response. Once I implemented your suggestion, I get the
following error when trying to access the school's website from WITHIN
the LAN. Why can it not find the URL?

ERROR

The requested URL could not be retrieved

The following error was encountered while trying to retrieve the URL:
http://www.twinlakes.k12.wi.us/

Connection to 216.56.4.133 failed.
The system returned: (110) Connection timed out


Best Regards,
Mike

On Wed, Apr 27, 2011 at 1:16 AM, Andrew Beverley <andy@andybev.com> wro=
te:
> On Tue, 2011-04-26 at 22:07 -0500, Mike Hendrie wrote:
>> All,
>> I have a PROXY server with 2 Nics. =A0One is public facing NIC, the
>> other is private facing Nic.
>
> I assume that you mean a web proxy and that all your clients already =
use
> the server as their default gateway?
>
>> What would be the best settings to force all private IPs, on the LAN=
,
>> to pass through the Proxy server?
>
> Depending on the answer to the above, something like this:
>
> iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 \
> =A0 =A0 =A0 =A0-j REDIRECT --to-port 3128
>
> Your proxy server will need to support transparent proxying.
>
> Andy
>
>
>
