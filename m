From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: Spoofed ip's
Date: Wed, 12 Feb 2003 02:28:03 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030212022803.009d8ad0.arnt@c2i.net>
References: <1044948351.23287.11.camel@filth.sadomain.co.za>
	<3E491D30.1000909@maximum-linux.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E491D30.1000909@maximum-linux.net>
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

On Tue, 11 Feb 2003 15:56:32 +0000, 
uniplex <uniplex@maximum-linux.net> wrote in message 
<3E491D30.1000909@maximum-linux.net>:

> 
>  Would something like this look a little better for you?
> 
>  RESERVED_NET="0.0.0.0/8 1.0.0.0/8 2.0.0.0/8 5.0.0.0/8 7.0.0.0/8 
>  10.0.0.0/8 23.0.0.0/8 27.0.0.0/8 31.0.0.0/8 36.0.0.0/8 37.0.0.0/8 
>  39.0.0.0/8 41.0.0.0/8 42.0.0.0/8 58.0.0.0/8 59.0.0.0/8 60.0.0.0/8 
>  69.0.0.0/8 70.0.0.0/8 71.0.0.0/8 72.0.0.0/8 73.0.0.0/8 74.0.0.0/8 
>  75.0.0.0/8 76.0.0.0/8 77.0.0.0/8 78.0.0.0/8 79.0.0.0/8 81.0.0.0/8 
>  82.0.0.0/8 83.0.0.0/8 84.0.0.0/8 85.0.0.0/8 86.0.0.0/8 87.0.0.0/8 
>  88.0.0.0/8 89.0.0.0/8 90.0.0.0/8 91.0.0.0/8 92.0.0.0/8 93.0.0.0/8 
>  94.0.0.0/8 95.0.0.0/8 96.0.0.0/8 97.0.0.0/8 98.0.0.0/8 99.0.0.0/8 
>  100.0.0.0/8 101.0.0.0/8 102.0.0.0/8 103.0.0.0/8 104.0.0.0/8
>  105.0.0.0/8 106.0.0.0/8 107.0.0.0/8 108.0.0.0/8 109.0.0.0/8
>  110.0.0.0/8 111.0.0.0/8 112.0.0.0/8 113.0.0.0/8 114.0.0.0/8
>  115.0.0.0/8 116.0.0.0/8 117.0.0.0/8 118.0.0.0/8 119.0.0.0/8
>  120.0.0.0/8 121.0.0.0/8 122.0.0.0/8 123.0.0.0/8 124.0.0.0/8
>  125.0.0.0/8 126.0.0.0/8 127.0.0.0/8 172.16.0.0/12 192.168.0.0/16
>  197.0.0.0/8 201.0.0.0/8 219.0.0.0/8 220.0.0.0/8 220.0.0.0/8
>  221.0.0.0/8 222.0.0.0/8 223.0.0.0/8 224.0.0.0/4 240.0.0.0/8
>  240.0.0.0/5 241.0.0.0/8 242.0.0.0/8 243.0.0.0/8 244.0.0.0/8
>  245.0.0.0/8 246.0.0.0/8 247.0.0.0/8 248.0.0.0/8 249.0.0.0/8
>  250.0.0.0/8 251.0.0.0/8 252.0.0.0/8 253.0.0.0/8 254.0.0.0/8
>  255.0.0.0/8"

..some of these above are redundant, and some (wintendos?) need
255.255.255.255/32, play with 'ipcalc -bnmp 0.0.0.0/1' upwards. 

..you may also want to distinguish between reserved and private 
nets, 10.0.0.0/8, 172.16.0.0/12 and 192.168.0.0/16, and loopback 
127.0.0.0/8 and the "outcasts" 224.0.0.0/4 and 240.0.0.0/4.  ;-)

>  for NET in $RESERVED_NET, do

# ..or, if the above comma fails on you: 
   for NET in $RESERVED_NET ; do  # ;-)

>  	iptables --append spoofed_ip --source $NET -jump spoof_log
>  done
> 

..sed, seq, awk, etc magic, anyone?  ;-)

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.


