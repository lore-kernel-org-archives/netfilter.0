From: James Morris <jmorris@intercode.com.au>
Subject: Re: Compiling problem with libipq
Date: Tue, 3 Dec 2002 14:30:27 +1100 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Mutt.LNX.4.44.0212031430010.26691-100000@blackbird.intercode.com.au>
References: <1038877105.16909.21.camel@stolberg>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1038877105.16909.21.camel@stolberg>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Worik <worik@noggon.co.nz>
Cc: netfilter@lists.netfilter.org

On 3 Dec 2002, Worik wrote:

> gcc -g -O0   -DIPT_LIB_DIR=/usr/lib    -lipq  ip_q.o -o ip_q

Try putting -lipq at the end of the end of this line.


-- 
James Morris
<jmorris@intercode.com.au>



