From: "Andrew Smith" <nfml@k1k2.com>
Subject: RE: Trouble with --dport
Date: Tue, 22 Oct 2002 20:42:17 +1000 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <37755.192.168.7.14.1035283337.squirrel@iw.k1k2.com>
References: <DBAC6BAF12D1D64289EC75515BD865776858F2@exch101>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <DBAC6BAF12D1D64289EC75515BD865776858F2@exch101>
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

> Hey,
> 
> I had a similar problem. The cause was running the recent kernel
> version and an older iptables. I upgraded iptables to the latest
> version and my problem was solved.
> 
> Wouter
> 
> -----Original Message-----
> From: Kim Leandersson [mailto:kim.leandersson@chs.chalmers.se] 
> Sent: dinsdag 22 oktober 2002 9:59
> To: Antony Stone; netfilter@lists.netfilter.org
> Subject: RE: Trouble with --dport
> 
> I also got those errors when using v1.2.5. The iptables-save added a
> "-m" in my rules-save and that caused the same error as "blah blah". I
> edited the file (/var/lib/iptables/rules-save) and then restored the
> rules again and it worked just fine after that. In the latest version
> of iptables this is fixed.
> 
> //kim
> 
>> -----Original Message-----
>> From: Antony Stone [mailto:Antony@Soft-Solutions.co.uk] 
>> Sent: Monday, October 21, 2002 11:15 PM
>> To: netfilter@lists.netfilter.org
>> Subject: Re: Trouble with --dport
>> 
>> 
>> On Monday 21 October 2002 10:07 pm, blah blah wrote:
>> 
>> > The exact error message is:
>> > iptables-restore v1.2.5: Unknown arg `--dport`
>> 
>> Okay, so this is an error from iptables-restore, not the 
>> straight iptables 
>> command (which is what I'd mistakenly thought you meant at first).
>> 
>> What commands did you set up before using iptables-save, and 
>> what is your 
>> saved configuration ?
>> 
>> Antony.

No idea if this helps, but my firewall script/rules look like:

udp="-m udp -t udp"
dp="--destination-port"
iptables -A FORWARD -i $inet $udp -d 0/0 $dp 2002 -j DROP

(this is to stop bugtraq :-)

-- 
-Cheers
-Andrew

MS ... if only he hadn't been hang gliding!


