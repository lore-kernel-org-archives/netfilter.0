From: Gavin Hamill <gdh@acentral.co.uk>
Subject: Re: Could be a stupid question...
Date: Tue, 18 May 2004 14:42:18 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405181442.18063.gdh@acentral.co.uk>
References: <200405172155.06592.dennis@airstrike.co.nz> <200405171126.28093.Antony@Soft-Solutions.co.uk> <200405190108.50311.dennis@airstrike.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200405190108.50311.dennis@airstrike.co.nz>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Tuesday 18 May 2004 14:08, Dennis Morgan wrote:

> Hi
> Thanks Antony for the suggestion about using SQUID in a reverse proxy
> configuration..    Your suggestion actually come at a pretty good time,
> bcos it solves another problem.. Thanks...
>
> Also Gavin, that package, i am going to test it later on, when i am back in
> the office in the test lab to see if i can get it to work...  It will just
> mean i will have to upgrade the linux router to 2.6 so i can use it..

Yep, it's another good reason to learn about 2.6 sooner rather than later.. my 
own pressing problem with 2.6 is the native IPSec not having an 'ipsec0' 
interface (as was discussed on this list quite recently)..

I may actually apply the FreeS/WAN patches and remove the kernel native stuff, 
to be honest. 

Once I get that cracked, I'll be doing some layer 7 filtering on the firewall 
here :)

Cheers,
Gavin.

