From: Optimus Prime <optimusprime@o2.pl>
Subject: patch-o-matic & compiling it
Date: Wed, 23 Apr 2003 12:20:29 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3EA668ED.9000405@o2.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

Hi

I have a lame problem here I can't win with.
I wanted to use one of the features provided by the new path-o-matic, 
but I have problems compiling them into modules/kernel.

this is what I did:
make clean ( in kernel)
./runme --batch extra (provided the correct kernel dir it said I can 
compile the kernel)
make config(there was no new options from POM)
make modules
make modules_install

Krystian


