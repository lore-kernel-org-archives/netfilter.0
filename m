From: Akshat Kakkar <akshat.1984@gmail.com>
Subject: Re: NFLOG Performance issues ...
Date: Tue, 5 Sep 2017 18:20:23 +0530
Message-ID: <CAA5aLPhjaOat800R+Wk4cqScw0YGxWx_UnHAfzT3Ln5NrUXhCw@mail.gmail.com>
References: <CAA5aLPgoCdJcFZk0iScnNXNPjv04XbkFEdfAjpwq32u4xd8zPg@mail.gmail.com>
 <CAA5aLPgAktg8etg=Zq0ihbcTB0F9MyDf_KQaVRNHQi-ubWdJXQ@mail.gmail.com>
 <20170901094319.GA2519@salvia> <CAA5aLPgxg5pSh1HJ6z5C1wiWXzrjCXj70wFe9_JESFfLgES1rw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=E5rdIwcURXBXRYppaidv+rMAOrgXG+n8K1Re7GA+OHg=;
        b=NeQMmnOqzOhjww5d7hgi2Cdo25KWsUwOG5uKXb5bbYDWG/00nHq9AxzkFVHTge4R6R
         gAP1ryoykyK2d6B8H8KW9cmbSd2epR80YKT7cwL8nxprRevfsW+zhhxmGFP30fGmPoiU
         SOyTMuuvbC4IN1x2+Kb0JQaFHSjrVlveG6vwQ3mzJAiAIuFQYAV73oOGfpQpHSalOMtJ
         IZXtlQpiLLjP/WGTfMh6kIvQj6FeJ8MTzHGnHvWd7Fe4lW9CP3XWBPHPg1OQsSkT5d1a
         bvD8gWc17+1rWQ3sHntu3FHyWjcmoGY7NOAkB878By2nj1sWdHQ4vXv1QPTl9kjwMQJt
         +20g==
In-Reply-To: <CAA5aLPgxg5pSh1HJ6z5C1wiWXzrjCXj70wFe9_JESFfLgES1rw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

I am not able to log more than 150/sec.

Can anybody share their performance results when writing logs from
NFLOG/ULOG to postgres or mysql.

Please share your performance parameters too.

Thanks.
