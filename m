From: Amos Jeffries <squid3@treenet.co.nz>
Subject: Re: Marking particular programs
Date: Sat, 01 Nov 2008 18:35:47 +1300
Message-ID: <490BEAB3.1010406@treenet.co.nz>
References: <490A45BF.5060800@amfes.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <490A45BF.5060800@amfes.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: dmiller@amfes.com
Cc: netfilter@vger.kernel.org

Daniel L. Miller wrote:
> Is it possible to "mark" packets from particular programs running on the 
> routing server?  Such as Squid or Apt?
> 
> Without this, I have no way (that I know of) of identifying the nature 
> of the HTTP traffic so I can limit it accordingly.

Squid marks its own traffic for QoS as needed.
Recent versions go as far as to set it based on originating source for 
better external/internal flow handling.

apt can be configured to use Squid or system proxy settings for more 
efficient bandwidth usage.

Amos Jeffries
Squid Developer
