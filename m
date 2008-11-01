From: "Daniel L. Miller" <dmiller@amfes.com>
Subject: Re: Marking particular programs
Date: Sat, 01 Nov 2008 13:16:08 -0700
Message-ID: <490CB908.1030908@amfes.com>
References: <490A45BF.5060800@amfes.com> <490BEAB3.1010406@treenet.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <490BEAB3.1010406@treenet.co.nz>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Amos Jeffries wrote:
> Daniel L. Miller wrote:
>> Is it possible to "mark" packets from particular programs running on 
>> the routing server?  Such as Squid or Apt?
>>
>> Without this, I have no way (that I know of) of identifying the 
>> nature of the HTTP traffic so I can limit it accordingly.
>
> Squid marks its own traffic for QoS as needed.
> Recent versions go as far as to set it based on originating source for 
> better external/internal flow handling.
>
> apt can be configured to use Squid or system proxy settings for more 
> efficient bandwidth usage.
>
> Amos Jeffries
> Squid Develo
Thank you.  For Squid, I assume you're referring to the 
'tcp_outgoing_tos" parameter.  For Apt, I don't see how to handle it - 
except to run a 2nd copy of Squid, which I don't want to do.

-- 
Daniel
