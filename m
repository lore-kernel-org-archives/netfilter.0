From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: IPSec - IPTables issues
Date: Wed, 05 May 2004 14:07:03 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40993B57.6070309@pbl.ca>
References: <20040502155538.GD515@schottelius.org> <200405051622.26944.Antony@Soft-Solutions.co.uk> <40991270.5030803@pbl.ca> <200405051829.14783.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200405051829.14783.Antony@Soft-Solutions.co.uk>
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
To: netfilter@lists.netfilter.org

Antony Stone wrote:
> On Wednesday 05 May 2004 5:12 pm, Aleksandar Milivojevic wrote:
>>Actually, I like better Linux 2.6 implementation that doesn't use virtual
>>devices.
> 
> Yes, it seems like a better design; now if only we could work out how to 
> filter the unencrypted traffic before it all just disappears down the tunnel, 
> it might turn out to be a good idea.

You let IPSec kernel module take care that anything unencrypted comming 
from the wire or into the wire is dropped.  This should be easily 
acomplished by setting IPSec policy for the connection to required.  So 
you do not need Netfilter to filter out unencrypted traffic from the 
wire.  IPSec is going to do that for you.

Than in Netfilter, you accept packets if they are:

1. IPSec packets (AH, ESP, UDP/500)
2. unencrypted packets for the services (HTTP, FTP, telnet, etc) you are 
allowing

This way, Netfilter will take care of packets before they are encrypted, 
and after they are decrypted.  Therefore protecting the local services 
and allowing you to filter "before it all just dissapears down the 
tunnel".  IPSec will take care that there is no unecrypted traffic going 
onto the wire (or accepted from the wire).

So you don't need virtual interface to differentiate first and second 
pass through Netfilter's chains.

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

