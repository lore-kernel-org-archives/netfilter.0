From: James MacLean <macleajb@ednet.ns.ca>
Subject: Re: Private traffic seen on public NATed interface - Linux 2.6.10-11
 tested
Date: Tue, 15 Mar 2005 16:57:47 -0400
Message-ID: <42374C4B.8070801@ednet.ns.ca>
References: <423737E2.4050201@ednet.ns.ca> <42374547.7030204@fastwebnet.it>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------020702090202030602040003"
In-Reply-To: <42374547.7030204@fastwebnet.it>
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
To: NetFilter <netfilter@lists.netfilter.org>

This is a multi-part message in MIME format.
--------------020702090202030602040003
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Francesco Ciocchetti wrote:

> James MacLean wrote:
>
>> While we were dumping traffic on the public interface, we noticed 
>> private IPs showing up in our dumps.
>>
>> We verified that there existed sessions between private IPs and 
>> public Internet sites where some of the private traffic was returning 
>> to the Internet site not NATed.
>>
> I hope that my "English knowledge' is joking me here ... how can be 
> established session beetween you 'private IPs ' and Internet Server??
> This is really impossible ... your packets, with private ip source, 
> would never reach any internet server cause at least your ISP routers 
> will surely filter on RFC 1918 addresses.
>
There is a session properly NATed between the client and the server. It
just happens that some traffic in that session escapes from being NATed
on it's way from the client (private IP space) to the server. How far it
gets we do not know :).

>> We started watching, and saw this occur on servers with 2.6.11 and 
>> 2.6.10 kernels which are all we have to test with.
>>
>> These kernels were compiled locally.
>>
>> For example, tcpdumping on a public interface where no private IPs 
>> should live :
>>
>> 15:19:22.066190 IP 10.0.7.100.2640 > 142.176.33.171.http: R 
>> 2946695981:2946695981(0) ack 4138631275 win 0
>> 15:19:22.066516 IP 10.0.7.100.2641 > 142.176.33.170.http: R 
>> 818314876:818314876(0) ack 4144245614 win 0
>> 15:19:22.066684 IP 10.0.7.100.2638 > 142.176.33.170.http: R 
>> 3381617258:3381617258(0) ack 4136231656 win 0
>> 15:19:22.067353 IP 10.0.7.100.2639 > 142.176.33.170.http: R 
>> 3920569986:3920569986(0) ack 4133397861 win 0
>> 15:19:22.068045 IP 10.0.7.100.2642 > 142.176.33.170.http: R 
>> 3340982500:3340982500(0) ack 4135371285 win 0
>> 15:19:24.001820 IP 10.0.5.13.2023 > 65.54.194.118.http: F 0:0(0) ack 
>> 1 win 64790
>>
>>
> this dump is really weird ... here we see packets from your private IP 
> to public IP with RST and FIN flags ... how can you rst or fin a 
> connection if you never established it? i would expect some SYN that 
> never would get any ACK ... but RST and FIN are really really weird.
>
This dump is only part of the traffic between the two nodes. The other
properly NATed traffic was left out.

> are you sure you have run tcpdump on public interface?
>
Definitely. We have tried now from 3 boxen at 2 different sites with the
same result.

>> Is there something we may have been setting up incorrectly?
>> JES
>
> i really think so :)
>
> bye
> P.

Us too ;).

Could not give an iptables dump from this site as it is huge and
revealing, but will see if the table from the second site is available.

Any other questions or comments welcome,
JES


--------------020702090202030602040003--

