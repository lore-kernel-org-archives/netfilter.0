From: ypresente@mrv.com (Yaron Presente)
Subject: Re: RTSP netfilter patch for 2.4.18
Date: Wed, 29 Sep 2004 09:15:56 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <415A612C.2030205@mrv.com>
References: <20040928235104.GA21363@home.tig-grr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tom Marshall <tommy@home.tig-grr.com>
Cc: netfilter@lists.netfilter.org



Tom Marshall wrote:

>On Tue, Sep 28, 2004 at 07:33:33PM +0200, Yaron Presente wrote:
>  
>
>>Hi All,
>>Is anyone aware of a RTSP netfilter patch which is suitable for a 2.4.18 
>>kernel (I could only find a patch for 2.4.21).
>>If no such patch already exists, should there be any significant problem 
>>to adapt the 2.4.21 patch to 2.4.18?
>>    
>>
>
>Does the patch apply cleanly?  If it does, it should work okay.
>  
>
No, unfortunately it doesn't. I had a problem with the modifications in 
netfilter_ipv4/ip_conntrack.h .
The patch tries to insert exp_rtsp_info and ct_rtsp_info into the union 
ip_conntrack_expect_help,
which does not exist in my 2.4.18 source.
Looking at the ftp 2.4.18 patch as a reference, I see that a ct_ftp_info 
does exist, but in a different context in the header file.
an exp_ftp_info structure, however, is not defined at all.
Any ideas?

>  
>
-- 
Yaron Presente
MRV International
Direct   : 972-4-9936237
Fax      : 972-4-9890564
Email   : ypresente@mrv.com
www.mrv.com






