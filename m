From: Ivan Petrushev <ivanatora@gmail.com>
Subject: Re: what is the '-m' flag?
Date: Tue, 2 Jun 2009 23:30:34 +0300
Message-ID: <d39744a20906021330g258da21drf879151a200a5e5f@mail.gmail.com>
References: <4A258A3A.8080200@veltrac.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :from:date:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=+pYZfy6h0/8qhCcZEzXr/AQmwWneNMkbdaul1HG1m4Q=;
        b=pQuAPcreaA+oYi1sJZMpytFycaMpdcKWT4Ms6JX05IWpRFgXeGCFaAaRfG8Uu+WNfV
         zjk2mOxjrDdGmw/kcrO8WM9je+zgaDeRD48MPKH14YKNkVQf8nx9jimbulbZNNMBnFCL
         nQ7gOo7M7oxkD7KdiJ5TeeIujJikr6LcFkg34=
In-Reply-To: <4A258A3A.8080200@veltrac.com.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Leonardo Carneiro <lscarneiro@veltrac.com.br>
Cc: netfilter@vger.kernel.org

man iptables v.1.3.7
MATCH EXTENSIONS
       iptables can use  extended  packet  matching  modules.   These  are
       loaded in two ways: implicitly, when -p or --protocol is specified,
       or with the -m or --match options, followed by the matching  module
       name; after these, various extra command line options become avail-
       able, depending on the specific module.
