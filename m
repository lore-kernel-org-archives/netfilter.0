From: Alistair Tonner <Alistair@alistairt.ath.cx>
Subject: Re: ftp server issue, trying to DL 1.2.7a
Date: Sat, 7 Sep 2002 11:40:26 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020907154026.GA12045@Ajftl1.ajfthome.on.ca>
References: <3D7877D3.6040608@fugmann.dhs.org> <3D79F330.000001.00620@athlon1000> <3D79FC89.9070001@fugmann.dhs.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <3D79FC89.9070001@fugmann.dhs.org>; from afu@fugmann.dhs.org on Sat, Sep 07, 2002 at 09:18:01 -0400
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: Anders Fugmann <afu@fugmann.dhs.org>
Cc: wickedsun <wickedsun@phreaker.net>, netfilter@lists.netfilter.org



	You need to add the parameter name:
	in this case ports.

	modprobe ip_conntrack_ftp ports=21,5006
	modprobe ip_nat_ftp ports=21.5006
	 
	or if built into the kernel, I don't believe you can pass a port
	parameter to the the module. (Just a quick glance at the
	source ... so if I'm wrong someone will hit me over the head
	I'm sure).

On 2002.09.07 09:18 Anders Fugmann wrote:
> wickedsun wrote:
>> FTP Issues, round 2.
>>   With further testing, I've noticed that it doesnt quite work. For 
>> some unknown reason, it *seems* to work on port 21, but doesnt on 
>> other
> Seems or does?
> 
>> ports. From what I understood in your post, you said it would work 
>> on any port. (FTP, of course).
> 
>> 
> No. The ftp connection tracking module only monitors on port 21. 
> Because it has to examine all packets beeing send though, it would 
> simple be too much work to monitor any connection made. If you want 
> it to monitor other ports also, you can compile the ftp connection 
> tracking as a module, and then use:
> modprobe ip_conntrack_ftp 21,5006
> to let it listen on ports 21 and 5006.
> 
> I do not know if there is any way to make this work with 
> ftp_connection_tracking statically compiled in the kernel.
> 
> Regards
> Anders Fugmann
> 
>-- 
> Author of FIAIF
> FIAIF Is An Intelligent Firewall
> http://fiaif.fugmann.dhs.org
> 
> 
> 


