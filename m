From: =?ISO-8859-1?Q?Humberto_Juc=E1?= <betolj@gmail.com>
Subject: Re: Help with packet marking
Date: Thu, 29 Mar 2012 11:25:07 -0400
Message-ID: <CACuyg27nZOavD2qs45WW-87TxNTrmi85zStKLmUvZ-EVmyegMg@mail.gmail.com>
References: <4F74194E.9030608@kickstone.co.uk>
	<CACuyg262eXScuo6aLusyOScU4NEo7PEjbUqEOX_G0E-gaKS=XQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=p6vaQm7KXmf0Lh13SjQgBaBUGgpPAb65XM/iUs2Gqfk=;
        b=Uw62vsTxr0XwOl7w0QPn7KgZ3fk7gLq8O9xflFB5+9CDOHj2/AsBe6dpKNu/HPNDS8
         EmFTv1a8+ZrTKMlcQjaStepiRl0LGrk4HL99CKxJtedrBXTWjUwRi9/shp4bQLoZsfOi
         XcAEsYFe5vJO9Lp7wNhRWqc0YqRd3s9nablz3C0hC2QIrQBYY5sI845t/1BqHtHjUN5s
         KFqTNPLjX2Zh+OICF2N67x6n3LUQcOnWP0fYfbG5AngJotTByKLSZ4XIHeNyK1iaGoG1
         jqaPUrzNB3jX+XZaNA8haWRRKXbZKxkUh1/S7by0l+6390CXL9mtAjH4CAFbwnNwQN2l
         jhcg==
In-Reply-To: <CACuyg262eXScuo6aLusyOScU4NEo7PEjbUqEOX_G0E-gaKS=XQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John Lister <john.lister@kickstone.co.uk>
Cc: netfilter@vger.kernel.org

I still do not understand why your conntrack display MARK 0x1 and your
RPDB do a table lookup with 0x101 or 0x103.
