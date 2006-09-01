From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: how to set ports for ip_conntrack_ftp
Date: Fri, 1 Sep 2006 07:59:12 +0200
Message-ID: <000901c6cd8b$bfbb28e0$0101000a@tanjian>
References: <20060831224857.GA23094@freesources.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060831224857.GA23094@freesources.org>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

>>> where can i set the ports for ip_conntrack_ftp?
>>> 
>>> if i load it as module, i can use
>>> 'modprobe ip_conntrack_ftp ports=21,31,41'
>>> 
>>> but if the module is compiled into the kernel, i have no idea how
>>> to set the ports. i didn't find anything in either /proc or
>>> kernel-source/Documentation. 
>>> 
>>> the server is running linux kernel 2.4.27.
>> 
>> Hmm, I don't know about 2.4.x kernels but in 2.6.x you can always set
>> parameters to integrated modules on the kernel comand line.
>> 
>> In your case it would be:
>>  ip_conntrack_ftp.ports=21,31,41
> 
> how can i use this kernel command line?
> do you mean sysctl?

No.
You should edit your lilo.conf or grub.conf for this and look for the
line that says where your kernel is (probably: /boot/...). Append
"ip_conntrack_ftp.ports=21,31,41" to it.
Then, reboot the server.


Gr,
Rob


