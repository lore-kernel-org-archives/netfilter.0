From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: logging mac address
Date: Tue, 15 Jul 2003 16:59:36 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030715205936.GO24604@cannon.eng.us.uu.net>
References: <7C9884991ADAE0479C14F10C858BCDF5122DF5@alderaan.smgtec.com> <OFED428E53.CB94B945-ON83256D64.006E5081-83256D64.006E6B88@LocalDomain>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <OFED428E53.CB94B945-ON83256D64.006E5081-83256D64.006E6B88@LocalDomain>
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
Content-Transfer-Encoding: 7bit
To: Antonio Paulo Salgado Forster <aforster@br.ibm.com>
Cc: netfilter@lists.netfilter.org

On Tue, Jul 15, 2003 at 05:06:04PM -0300, Antonio Paulo Salgado Forster wrote:

> 
> 
> Hello all,
> 
>       Is there any known way to log the mac address for packets blocked on
> the forward table just like in the input table? I've been searching the
> archives and documentations but found nothing so far.

forward and input are chains and not tables. nat, mangle and filter are
tables. But anyhow, you just use the same rule for logging that you
used for INPUT logging and replace INPUT with FORWARD. You also need
to make sure what and where you're logging so that you don't DoS yourself.

Ramin

> 
> Thanks in advance.
> 
> Forster
> 
> 

