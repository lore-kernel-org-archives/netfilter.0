From: Trevor Cordes <netfilter@tecnopolis.ca>
Subject: Re: Netfilter and IPSec interaction
Date: Wed, 10 Aug 2005 07:02:41 -0500
Message-ID: <20050810120241.GA12680@pog.tecnopolis.ca>
References: <20050714122109.bl71ded9gkkoc0c4@www.milivojevic.org>
	<42DB20CE.5040401@milivojevic.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <42DB20CE.5040401@milivojevic.org>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Sun, Jul 17, 2005 at 10:23:58PM -0500, Aleksandar Milivojevic wrote:
> 
> Apperently, this is a known problem and it has been discussed on 
> Netfilter's development lists.  There are some patches that solve it, 
> but they are not going to get into mainstream kernel since approach 

I can now confirm that the current PoM 2.6sec/NAT patches do compile into 
a 2.6.12 kernel (for me FC3 2.6.12-1.1372) with a few modifications to 
dependencies, etc.  I will be heavily testing this new kernel very 
shortly.

> taken in them is problematic (and according to some sources, those 
> patches are abandoned and not maintained anymore).  I wasn't able to 
> find why the approach is problematic, but apperently answer to that 

From my understanding, the patches are too broad and affect too many 
source files.  It's not "clean" and prone to maintenance errors.  The way 
it's coded/architected needs to be rethought and will probably require a 
rethink/rewrite of much more than just the bits the patch touches.

> question is burried somewhere in archives of Netfilter's development 
> list.  Seems that correct approach to solve the problem still needs to 
> be found (and once found and implemented will become part of mainstream 
> kernel).

Yes, it would be nice to see that some effort is going into this problem.

