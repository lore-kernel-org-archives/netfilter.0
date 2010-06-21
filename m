From: Pete Kay <petedao@gmail.com>
Subject: Re: newbie question on netfilter-conntrack
Date: Mon, 21 Jun 2010 17:20:54 +0800
Message-ID: <AANLkTim-u04UoPqvo6fHkjPqVvCtHgYLJFy_Xk6Ekrpe@mail.gmail.com>
References: <AANLkTil9wrgMngn6vFqKeh-WNKkEmwCXYJx-lGI5RAu5@mail.gmail.com>
	<alpine.LSU.2.01.1006201415260.26430@obet.zrqbmnf.qr>
	<AANLkTinsKIGo4Rh76F7qDF2HpRZZeEqfAxNzDWnMJtWJ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:content-type;
        bh=lvFZG2h5XshoYERgWIdpBiT+YAqPtHHqOf2mGifelfk=;
        b=gA3W4ukFEhz5wvjgSK8/Uae7VX6agLcdtCJ1EUWkSD4XfwOWmKRJsJzXN6nZmFSMSC
         2EXV58V4KwJXyO9De8O4HUMY6UBiZ3n4PUrH1jyR1w1wi6KGXbG1AKWUA01D4fLshg22
         LM4nvHdXLmkKoh2SrVfUdO1O5J/OlQ7dAzmOQ=
In-Reply-To: <AANLkTinsKIGo4Rh76F7qDF2HpRZZeEqfAxNzDWnMJtWJ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

Sorry for posting multiple times.  This should be my last one.

I modified the conntrack_create_nat.c to redirect udp traffic coming
from a specific IP:port to another IP, but the program gives error,
the result of ret is (-1).  Does anyone know what's wrong?

#include <stdio.h>
#include <stdlib.h>
#include <errno.h>

#include <libnetfilter_conntrack/libnetfilter_conntrack.h>
#include <libnetfilter_conntrack/libnetfilter_conntrack_udp.h>

int main()
{
	int ret;
	struct nfct_handle *h;
	struct nf_conntrack *ct;

	ct = nfct_new();
	if (!ct) {
		perror("nfct_new");
		return 0;
	}

	nfct_set_attr_u8(ct, ATTR_L3PROTO, AF_INET);
	nfct_set_attr_u32(ct, ATTR_IPV4_SRC, inet_addr("192.168.1.12"));
	nfct_set_attr_u32(ct, ATTR_IPV4_DST, inet_addr("192.168.1.102"));
	
	nfct_set_attr_u8(ct, ATTR_L4PROTO, IPPROTO_UDP);
	nfct_set_attr_u16(ct, ATTR_PORT_SRC, htons(5060));
	nfct_set_attr_u16(ct, ATTR_PORT_DST, htons(5060));

	nfct_setobjopt(ct, NFCT_SOPT_SETUP_REPLY);
	//nfct_set_atrr_u8(ct, ATTR_UDP_STATE, UDP_CONNTRACK_SYN_SENT);
	//nfct_set_attr_u8(ct, ATTR_TCP_STATE, TCP_CONNTRACK_SYN_SENT);
	nfct_set_attr_u32(ct, ATTR_TIMEOUT, 100);

	nfct_set_attr_u32(ct, ATTR_SNAT_IPV4, inet_addr("192.168.1.13"));

	h = nfct_open(CONNTRACK, 0);

	if (!h) {
		perror("nfct_open");
		return -1;
	}

	ret = nfct_query(h, NFCT_Q_CREATE, ct);

	printf("TEST: create conntrack ");

	if (ret == -1)
		printf("(%d)\n", ret);
	else
		printf("(OK)\n");

	nfct_close(h);

	ret == -1 ? exit(EXIT_FAILURE) : exit(EXIT_SUCCESS);
}
