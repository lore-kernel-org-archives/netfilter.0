From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: ddos / no connection tracking / tarpitting
Date: Fri, 22 Apr 2005 17:13:13 -0400 (EDT)
Message-ID: <Pine.LNX.4.60.0504221707050.15167@darkstar.sysinfo.com>
References: <BAY104-F417A02D74275560AA714548B2D0@phx.gbl>
	<42688A26.9000705@riverviewtech.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42688A26.9000705@riverviewtech.net>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Taylor Grant <gtaylor@riverviewtech.net>
Cc: Vic N <vic778@hotmail.com>, netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


the only way to really survive a ddos without affecting connectivity in 
any shapoe or form is to have a bigger pipe then the other end<s> does. 
idiots trying to ddos from a cable connection or dialup are not a problem 
and sufferable.  Those a tad higher in technical advancement with a bot 
net and tousands of zomies to attack from are likely to bring even the 
biggest pipes to a dead halt, at least getting in and our of the firewall 
gateway is impossible.  Traffic on the inside should be unaffected.

I've suffered attacks with a firewall not doing connection tracking and 
had no problems with either the firewall failing or suffereing a reboot. 
I have yet to suffer such an attack on a staeful firewall, but tend to 
think I should suffer no less with such a firewall in place as apposed to 
an the older mere packet filters I've been replacing over time.  Course, 
it helps to have enough RAM in the firewall in the firstplace...

pipes size and RAM, them be the keys to surviival.

Thanks,

Ron DuFresne

On Fri, 22 Apr 2005, Taylor Grant wrote:

>> A while ago I saw an iptables solution that was able to serve as an 
>> effective anti-ddos solution.   I didn't get to see under the hood, but 
>> the creator told me that the solution was essentially an iptables 
>> implementation with no connection tracking built in.  Allegedly, the fact 
>> that no connection tracking was used enabled the the iptables to deal with 
>> a much higher volume of traffic w/o crashing.  He had also mentioned using 
>> packet counting (to count packets as they passed through since there was 
>> no way to keep track of them otherwise) and using tarpitting.
>> 
>> While I can't attest to what the person told me, I do know the firewall 
>> was soaking up ddos traffic that was otherwise bringing servers to their 
>> knees with the use of regular connection-based firewalling.
>> 
>> So my question is, is this the basic element of building a good anti-ddos 
>> solution wtih iptables to address a *large* volume of ddos traffic to 
>> build iptables w/o connection tracking?
>> 
>> Thanks,
>
> Yes this is possible and (I think) fairly easy to do.  As I have never done 
> this I can not tell you for sure, but this is what I would do if I were to do 
> such a thing.
>
> I will presume that you are wanting to drop all traffic to a specif port on 
> an IP address for the sake of this discussion.
>
> iptables -t raw -A PREROUTING -d 1.2.3.4 -p tcp --dport 5678 -j NOTRACK
> iptables -t filter -A FORWARD -d 1.2.3.4 -p tcp --dport 5678 -j TARPIT
>
> This will cause any traffic that comes in that is distend to 1.2.3.4 on port 
> 5678 to  NOT be tracked with the connecting tracking sub system and to 
> subsequently be redirected to the TARPIT target.
>
>
>
> Grant. . . .
>

- -- 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         admin & senior security consultant:  sysinfo.com
                         http://sysinfo.com
Key fingerprint = 9401 4B13 B918 164C 647A  E838 B2DF AFCC 94B0 6629

...We waste time looking for the perfect lover
instead of creating the perfect love.

                 -Tom Robbins <Still Life With Woodpecker>
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFCaWjtst+vzJSwZikRAu6hAJ496gLuwc31uc2uiCNXzbk3AMA1SQCdEXNI
VfK1Yh+17fGQV6Qb6gRF8Zc=
=sgu8
-----END PGP SIGNATURE-----

