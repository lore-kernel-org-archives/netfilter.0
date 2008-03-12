From: Scott MacKay <scottmackay@yahoo.com>
Subject: Re: RHEL 4.5 + brigde + sample QUEUE app=panic
Date: Tue, 11 Mar 2008 21:45:34 -0700 (PDT)
Message-ID: <429463.14929.qm@web52408.mail.re2.yahoo.com>
References: <671872.8600.qm@web52403.mail.re2.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <671872.8600.qm@web52403.mail.re2.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

More details....

The culprit seems to be the memcpy(), transferring the
payload back into the skb.
memcpy(e->skb->data, v->payload, v->data_len); 

I commented that out, and put a "return 0;"after:
 e->skb->nfcache |= NFC_ALTERED;

(basically skip the memcop and extra routing).  Worked
fine.

I now put in a for loop to run several different
tests.  It basically was:
        for (index=0;index<v->data_len;index++)  {
          /* insert test */
        }
First was:
    c=v->payload[index];  /* read the payload */
No crashes.
Second was:
    c=e->skb->data[index]; /* read the skb payload */
No crashes.
Next was:
    c=e->skb->data[index];  /* read sky payload */
    e->skb->data[index]=c;  /* write value back */
No crashes.
Now
    c=v->payload[index];
    e->skb->data[index]=c;
No crashes.
Finally:
    e->skb->data[index]=v->payload[index];
Crashes.

My test was with wget-ting a kernel and I would
actually see read errors appear before it finally
died.

I wil be retesting the final couple, but any idea why
in the world the memcpy and memcpy-ish loop would
crash everything?

-Scott


--- Scott MacKay <scottmackay@yahoo.com> wrote:

> Related to this:
> I got and rebuilt the ip_queue.c code and it seems
> to
> be within the ipq_mangle_ipv4 code.  The top part
> does
> not affect us since that is only for when size
> changes.  I commented out the mangle call (so I was
> still passing data down) and the system seemed to
> run
> ok, just like data_len=0.
> 
> When I reenabled the memcpy and the ALTER flag
> change
> it worked for a while but then locked up, the
> keyboard
> lights flashing.
> 
> Note that this did not always/immediately cause a
> crash but pretty close.  The last thing I could try
> is
> a simple for loop on the incoming data to see if
> accessing the data (like char c=payload[i] kind of
> throwaway) is the issue.  If there are any thoughts
> on
> the stuff sendmsg() sends to the ip_queue I would
> love
> to know.  
> 
> -Scott



      ____________________________________________________________________________________
Looking for last minute shopping deals?  
Find them fast with Yahoo! Search.  http://tools.search.yahoo.com/newsearch/category.php?category=shopping
