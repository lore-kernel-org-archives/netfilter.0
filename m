From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Video connection timeout
Date: Fri, 13 May 2011 17:10:25 -0500
Message-ID: <4DCDAC51.4060303@riverviewtech.net>
References: <6C249D4B-8247-4FD1-AD60-73E596244B57@aol.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <6C249D4B-8247-4FD1-AD60-73E596244B57@aol.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 05/13/11 16:58, jobhunts02@aol.com wrote:
> When I have video running and the video stops, I see that the
> connection is destroyed in about 5 seconds, which is what I want.
>
> If, rather than stopping the video, I pull the plug, I have seen it
> take 350 and 380 seconds before the connection is destroyed.

Are you talking about how long it takes for the connection / socket to 
close on the system?  (I.e. netstat / ss show the connection.)

(For the sake of conversation, I'm assuming that I'm correct.)

> Why is there such a large difference in the time to destroy a video
> connection between stopping the video and pulling the plug on it?

If a video finishes it's playback and the player realizes that the video 
stream is finished, the player can issue the proper sequence to close 
the connection.  Where as if the player is in the middle of a stream and 
the data stops, the player will likely wait for a timeout (coded in the 
player) before giving up and aborting the playback.

> How can I shorten the time for the connection to get destroyed when
> pulling the plug?--

I don't know that there is much that you can do other than trying to 
close the connection (TCP Reset / ICMP Host Unreachable / etc.) to 
artificially cause the player to terminate playback early.



Grant. . . .
