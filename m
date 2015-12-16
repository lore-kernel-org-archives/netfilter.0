From: Sargun Dhillon <sargun@sargun.me>
Subject: libnetfilter_conntrack: set_attr_dnat_ipv4
Date: Wed, 16 Dec 2015 09:19:47 -0800
Message-ID: <CAMp4zn-eZ436Sig=Au0TepVk4=FL1Uc9xv66DT4zWNgRBoMuqw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sargun.me; s=google;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=ZkBa7Insyn91m1tZJtwbbAojSsxc9LMYp9SuP75NpZ0=;
        b=qsf/wsE27Nt7s7H2oVga9bc2HhsSOJ/k3sJ0LgR9DkrQtB5yuD1XGY7s/zkaZfkREu
         078hIVQkuNgYMlLoTWWgQixJqtTGp1otBYX5GwRjGPN9flrPgDbGFff12UnDKVVQADrY
         +sBz5kZ/vXIPe1zWcO1PFIkxA8k0CAGYNSs+g=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I'm curious, I'm looking at the libnetfilter_conntrack code, and I see
the following function definition:

static void
set_attr_dnat_ipv4(struct nf_conntrack *ct, const void *value, size_t len)
{
    ct->dnat.min_ip = ct->snat.max_ip = *((u_int32_t *) value);
}

Why does setting the DNAT_IPV4 attribute touch the snat.max_ip struct member?
