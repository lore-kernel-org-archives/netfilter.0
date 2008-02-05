From: "Srinivas Murthy" <codevana@gmail.com>
Subject: redirect rule question
Date: Tue, 5 Feb 2008 11:19:32 -0800
Message-ID: <df1bdeb10802051119w6b92ac21iae36c7d66cb94de8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:sender:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition:x-google-sender-auth;
        bh=8HgZH7zbppxAfK81PgNwSwvMxa+QhUeZ5mJUPZrfVHQ=;
        b=jxfIblhf4nMqQTmLKOGM5f5lLYPOanhHbBMbfcZtxt6k8T8+cz/ZbLW80kPDvGSc66kgKMrGS+Fs229qJyO9GSbw/DVOsnIQ5dzMwinPIB3mQLIbkSGhiq3Be5pq+os78iI+3nGmcJgchCKH6zHIIqZnjOsE3KoibUGib03A3XA=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi Guys,

 I need to write a redirect rule that does the following:

 If there is a mark set on an skb, (for any src or dst ip or port
no's), redirect to the port no equal to the mark.

 Please ignore the job of actually setting the mark on the skb is set
in kernel space by other means.

 Can you please give me an idea on how to add this rule?

Thanks.
