From: Eliezer Croitoru <eliezer@ngtech.co.il>
Subject: Re: TPROXY doesn't properly close connections in Linux 2.6.39
Date: Mon, 08 Oct 2012 21:04:50 +0200
Message-ID: <507323D2.4090200@ngtech.co.il>
References: <50721280.4020401@comcast.net> <50722737.3050202@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <50722737.3050202@comcast.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Brian G <bgunlogson5@comcast.net>
Cc: netfilter@vger.kernel.org

On 10/8/2012 3:07 AM, Brian G wrote:
> I found this changelog on  Wed, 19 Oct 2011 07:21:35:
>
> tproxy: copy transparent flag when creating a time wait
>
> The transparent socket option setting was not copied to the time wait
> socket when an inet socket was being replaced by a time wait socket. This
> broke the --transparent option of the socket match and may have caused
> that FIN packets belonging to sockets in FIN_WAIT2 or TIME_WAIT state
> were being dropped by the packet filter.
>
> Does this look like a fix to the problem I was having? What kernel
> version on kernel.org is this patch included in?
TPROXY is only a socket it wont close itself.. the software should know 
the state and other stuff on it and close it.
you should look at the software part to see why it wont close the 
connection and move on from there.

Regards,
Eliezer
