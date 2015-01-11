From: David Hagood <david.hagood@gmail.com>
Subject: Re: Usefulness of xt_recent's "last seen" and "oldest_pkt" on a tickless
 system
Date: Sun, 11 Jan 2015 09:52:58 -0600
Message-ID: <54B29C5A.3010708@gmail.com>
References: <alpine.LSU.2.11.1501111106300.616@nerf60.vanv.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=7f9g8XcXe3q50EQew/LgnqxVpC8hIHNyX0VCbbyRevs=;
        b=UBVzDL6ejwCWbu8r73Jh1h+JiXrbVda5qZ5okrfyCFXOlA1lFhwHruqg3IaoFEf/hO
         99BSMJlmlG+5d47X4dq0/NjupffnRHHkdOu6ecEgtDyoaVKaIv92KnreMmSTONNxvEMk
         3RfH9tlwznsBukYW8J4VWS7Ibm9vmfR0f9338wZpONXapQ14xANbMzkCVNlrf0B7NvHR
         0xYs5Ty8Na6YNbzv/qvS3wTcNQ4Mnt0ceNisRlYvUAGfyI5CI1vTRlttOcm3RGKmvJY4
         kxieBLisJspWJNZI6zCsbi6AKkrbZjYLDWm1pSwq74sZKz6RX1uOWIQXnUXWL1C7XPhY
         ldRg==
In-Reply-To: <alpine.LSU.2.11.1501111106300.616@nerf60.vanv.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@inai.de>
Cc: Netfilter user mailing list <netfilter@vger.kernel.org>

On 01/11/2015 04:23 AM, Jan Engelhardt wrote:
>
>> are just a count of the number of jiffies since boot. However, on a
>> tickless kernel, there is really no well defined number of jiffies per
>> second as far as I can tell
>
> You might want to have a look at
> static void tick_do_update_jiffies64(ktime_t now) in
> kernel/time/tick-sched.c ;-)
>

Thanks for the reply - at least now I know somebody is listening.

However, I looked over the function in question, and it does not seem to 
address my points:

1) It's a kernel only function. I am concerned about access from user space.
2) By inspection, my machine is running a jiffies per second value that 
varies between 2145 and 2150 jiffies per second (computed by reading the 
jiffies value from /proc/stat and reading the time since boot in 
seconds). There's simply no way to use a number with that much 
variability to compute when a packet was received - there has to be some 
way to know what the conversion was at the time the packet was logged, 
not at the current time. (and according to the configuration for the 
kernel, the nominal HZ value should be 1000, but full tickless mode is 
enabled - so that value does not seem to be used.)


