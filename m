From: "Shakthi Kannan" <x86processor@gmail.com>
Subject: Minimal network setup: Nano HOWTO
Date: Thu, 1 Feb 2007 02:54:29 +0530
Message-ID: <d0fd52cd0701311324g6cba2613ka578e9e91512dc9e@mail.gmail.com>
References: <d0fd52cd0701311316s29da1120rf5692b1dc019e3a6@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <d0fd52cd0701311316s29da1120rf5692b1dc019e3a6@mail.gmail.com>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,

I would like to know the minimal network setup to test Christoph
Simon's Nano-HOWTO:
http://www.ssi.bg/~ja/nano.txt

Is this setup appropriate?


           192.168.100.x
                     |
                     |
192.168.1.2 ------- 172.16.1.2
              ----|  A  |----
              |   -------   |
              |             |
              |             |
              |             |
              |             |
192.168.1.1 ------- 172.16.1.1
              ----|  B  |----
                  -------
                     |
                     |
                10.0.0.1

B:
* Runs kernel with Jason's patches as per the Nano HOWTO.
* NAT is running.
* ip_forward enabled.

A:
* Distro kernel.
* ip_forward enabled.
* Default route set to 192.168.100.1 (for example), that connects to
the Internet.

Is the above setup correct or is there any other way to test it?
Appreciate any help,

Thanks,

SK

-- 
Shakthi Kannan
http://www.shakthimaan.com

